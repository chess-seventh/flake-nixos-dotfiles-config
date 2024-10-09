# Helper function to integrate paru and fzf
faru() {
  pos=$1
  shift
  sed "s/ /\t/g" |
    fzf --nth=$pos --multi --history="$HOME/.fzf/history-yzf$pos" \
      --preview-window=60%,border-left \
      --bind="double-click:execute(xdg-open 'https://archlinux.org/packages/{$pos}'),alt-enter:execute(xdg-open 'https://aur.archlinux.org/packages?K={$pos}&SB=p&SO=d&PP=100')" \
       "$@" | cut -f$pos | xargs
}

# Dev note: print -s adds a shell history entry

# List installable packages into fzf and install selection
parufs() {
  cache_dir="$HOME/.fzf/tmp/yas-$USER"
  test "$1" = "-y" && rm -rf "$cache_dir" && shift
  mkdir -p "$cache_dir"
  preview_cache="$cache_dir/preview_{2}"
  list_cache="$cache_dir/list"
  { test "$(cat "$list_cache$@" | wc -l)" -lt 50000 && rm "$list_cache$@"; } 2>/dev/null
  pkg=$( (cat "$list_cache$@" 2>/dev/null || { pacman -Sl "$@"; paru -Sl aur "$@" } | sed 's/ [^ ]*unknown-version[^ ]*//' | tee "$list_cache$@") |
    faru 2 --tiebreak=index --preview="cat $preview_cache 2>/dev/null | grep -v 'Querying' | grep . || paru --color always -Si {2} | tee $preview_cache")
  if test -n "$pkg"
    then echo "Installing $pkg..."
      cmd="paru -S $pkg"
      print -s "$cmd"
      eval "$cmd"
      rehash
  fi
}
# List installed packages into fzf and remove selection
# Tip: use -e to list only explicitly installed packages
parufr() {
  pkg=$(paru --color=always -Q "$@" | yzf 1 --tiebreak=length --preview="paru --color always -Qli {1}")
  if test -n "$pkg"
    then echo "Removing $pkg..."
      cmd="paru -R --cascade --recursive $pkg"
      print -s "$cmd"
      eval "$cmd"
  fi
}

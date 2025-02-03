meteo(){
    CITY=$1
    curl wttr.in/$CITY
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

fat () {
    fzf --preview 'bat {}'
}

eip() {
    curl http://ifconfig.me
}

pdfshrink() {
    pdf=$1
    pdf_new=$(echo $pdf | sed 's/.pdf/-new.pdf/g')
    ps=$(echo $pdf | sed 's/pdf/ps/g')
    pdf2ps -dLanguageLevel=3 $pdf
    ps2pdf -dPDFSETTINGS=/ebook -sOutputFile=$pdf_new $ps
    rm $ps
}

pdfconcat() {
    src=$1
    dst=$2
    echo "Will Add PDF source: $src to destination: $dst"
    new_dst=$(echo $dst | sed 's/.pdf/-concat.pdf/g' )
    pdftk $dst $src cat output $new_dst
}

# Quickly display a man page using fzf and fd. MANPATH has to be set to a
# single directory (usually /usr/share/man). Accepts an optional argument for
# the manual section (defaults to 1).
fzf-man-widget() {
    batman="man {2} | col -bx | bat --language=man --plain --color always --theme=\"Monokai Extended\""
    man -k . | sort \
        | awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue;} 1' \
        | fzf  \
        -q "$1" \
        --ansi \
        --tiebreak=begin \
        --prompt=' Man > '  \
        --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
        --preview "${batman}" \
        --bind "enter:execute(man {1})" \
        --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
        --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
        --bind "alt-t:+change-preview(tldr --color=always {1})+change-prompt(ﳁ TLDR > )"
            zle reset-prompt
        }
        # `Ctrl-H` keybinding to launch the widget (this widget works only on zsh, don't know how to do it on bash and fish (additionaly pressing`ctrl-backspace` will trigger the widget to be executed too because both share the same keycode)
        bindkey '^h' fzf-man-widget
        zle -N fzf-man-widget
        # Icon used is nerdfont

# v - open files in ~/.viminfo
v() {
    local files
    files=$(grep '^>' ~/.viminfo | cut -c3- |
        while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
        done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
    }

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

vg() {
  local file

  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1}')"

  if [[ -n $file ]]
  then
     vim $file
  fi
}

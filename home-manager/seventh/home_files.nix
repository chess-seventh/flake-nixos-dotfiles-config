{
inputs,
lib,
pkgs,
config,
...
}: {

  home.file = {
    ".config/hypr/macchiato.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/hypr/macchiato.conf";
    ".config/hypr/pyprland.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/hypr/pyprland.toml";
# ".config/avizo/config.ini".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/avizo/config.ini";

    ".config/lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/lazygit/config.yml";

    ".config/qutebrowser/autoconfig.yml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/autoconfig.yml";
    ".config/qutebrowser/config.py".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/config.py";
    ".config/qutebrowser/quickmarks".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/quickmarks";

    ".config/qutebrowser/userscripts/cast".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/cast";
    ".config/qutebrowser/userscripts/gitclone".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/gitclone";
    ".config/qutebrowser/userscripts/password_fill".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/password_fill";
    ".config/qutebrowser/userscripts/qute_pass".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/qute_pass";
    ".config/qutebrowser/userscripts/readability".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/readability";
    ".config/qutebrowser/userscripts/readability-js".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/readability-js";
    ".config/qutebrowser/userscripts/taskadd".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/taskadd";
    ".config/qutebrowser/userscripts/translate".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/qutebrowser/userscripts/translate";

    ".config/dunst/dunstrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/dunst/dunstrc";

    ".config/tmate/tmate_colors.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmate/tmate_colors.conf";
    ".config/tmate/tmate_keybindings.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmate/tmate_keybindings.conf";
    ".config/tmate/tmate_options.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmate/tmate_options.conf";
    ".config/tmate/tmate_status_bar.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmate/tmate_status_bar.conf";

    ".config/htop/htoprc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/htop/htoprc";

    ".config/btop/btop.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/btop/btop.conf";

    ".config/newsraft/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/newsraft/config";
    ".config/newsraft/feeds".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/newsraft/feeds";

  };

}

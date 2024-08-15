# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    inputs.nix-colors.homeManagerModule
    ../common/global
    ../common/features/nvim
    ../common/features/desktop/hyprland
    # TODO: Remove when this bug is fixed. Disables libcamera
  ];

  home = {
    username = lib.mkDefault "seventh";
  };

  # Laptop specific configuration

  home.sessionPath = [
    "$HOME/.cargo/bin/"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    # GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";
    # XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
    # XCURSOR_SIZE = "24";
    # HYPRCURSOR_THEME = "Catppuccin-Macchiato-Teal";
    # HYPRCURSOR_SIZE = "24";
  };


  home.file = {
    # ".config/hypr/card".source = config.lib.file.mkOutOfStoreSymlink "/dev/dri/by-path/pci-0000:06:00.0-card";

    ".config/hypr/macchiato.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/hypr/macchiato.conf";
    ".config/avizo/config.ini".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/avizo/config.ini";

    ".config/lazygit/config.yml".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/lazygit/config.yml";

    ".config/qutebrowser/autoconfig.yml".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/autoconfig.yml";
    ".config/qutebrowser/config.py".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/config.py";
    ".config/qutebrowser/quickmarks".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/quickmarks";

    ".config/qutebrowser/userscripts/cast".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/cast";
    ".config/qutebrowser/userscripts/gitclone".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/gitclone";
    ".config/qutebrowser/userscripts/password_fill".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/password_fill";
    ".config/qutebrowser/userscripts/qute_pass".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/qute_pass";
    ".config/qutebrowser/userscripts/readability".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/readability";
    ".config/qutebrowser/userscripts/readability-js".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/readability-js";
    ".config/qutebrowser/userscripts/taskadd".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/taskadd";
    ".config/qutebrowser/userscripts/translate".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/qutebrowser/userscripts/translate";

    ".config/dunst/dunstrc".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/dunst/dunstrc";

    ".config/tmate/tmate_colors.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmate/tmate_colors.conf";
    ".config/tmate/tmate_keybindings.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmate/tmate_keybindings.conf";
    ".config/tmate/tmate_options.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmate/tmate_options.conf";
    ".config/tmate/tmate_status_bar.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmate/tmate_status_bar.conf";

    ".config/htop/htoprc".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/htop/htoprc";

    ".config/btop/btop.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/btop/btop.conf";

    ".config/tmux/tmux_colors.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmux/tmux_colors.conf";
    ".config/tmux/tmux_keybindings.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmux/tmux_keybindings.conf";
    ".config/tmux/tmux_options.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmux/tmux_options.conf";
    ".config/tmux/tmux_plugins_install.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmux/tmux_plugins_install.conf";
    ".config/tmux/tmux_plugins_setting.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmux/tmux_plugins_setting.conf";
    ".config/tmux/tmux_status_bar.conf".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/dotfiles/config/tmux/tmux_status_bar.conf";

  };

  home.packages = with pkgs; [
    bottom # System viewer
    ncdu # TUI disk usage
    httpie # Better curl
    diffsitter # Better diff

    # base
    #
    avizo
    dunst
    fish
    openssl
    pamixer
    pavucontrol
    pinentry
    pkg-config
    pre-commit
    pulseaudio
    rofi
    rofimoji
    texlive.combined.scheme-full
    xfce.thunar
    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization

    # shell
    #
    alacritty
    aria
    autojump
    bat
    bc
    cava
    chafa
    cmatrix
    delta
    direnv
    du-dust
    duf
    eza
    fd
    felix-fm
    figlet
    fortune
    fzf
    gh
    git
    git-extras
    gping
    jq
    just
    kitty
    lazygit
    libreoffice
    license-generator
    lsd
    lsof
    mcfly
    mdcat
    monolith
    mr 
    navi
    noti
    oh-my-zsh
    ouch
    pandoc
    pass-git-helper
    pipes-rs
    procs
    progress
    rewrk
    ripgrep
    rsclock
    sd
    tealdeer
    tgpt
    thefuck
    tmux
    tokei
    topgrade
    trash-cli
    tre-command
    tree
    unzip
    upx
    viu
    wget
    wofi
    wrk2
    xh
    yq
    zellij
    zoom-us
    zoxide
    zsh-bd
    zsh-completions
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    zsh-history
    zsh-powerlevel10k
    zsh-syntax-highlighting

    # ricing
    #
    fastfetch
    fuzzel
    hyprpaper
    sway
    swaybg
    tmate
    # vimPlugins.nvim-treesitter
    # waybar
    waypaper
    wl-clipboard

    # web & goodies
    #
    firefox
    chromium
    protonmail-bridge

    # dev tools
    #
    cargo
    devbox
    gcc
    go
    jdk
    julia
    lua
    lua-language-server
    luarocks
    nodejs
    php
    pipenv
    poetry
    python3
    teller
    zig

    # UNFREE
    #
    jetbrains.pycharm-professional
    obsidian
    spotify

    # productivity
    #
    qutebrowser
    scrot
    taskwarrior
    zathura

    # hyprland
    #
    hyprcursor
    hypridle
    # hyprlock
    hyprpicker
    imv
    mpv
    pyprland
    starship

    # info-fetchers
    #
    cpufetch
    dig
    ipfetch
    kmon
    liquidctl
    neofetch
    octofetch
    onefetch
    ramfetch
    speedtest-rs
    starfetch
    zfxtop

    # rust
    #
    bacon
    cargo
    cargo-audit
    cargo-bloat
    cargo-cross
    cargo-deny
    cargo-edit
    cargo-lambda
    cargo-license
    cargo-modules
    cargo-nextest
    cargo-outdated
    cargo-spellcheck
    cargo-tarpaulin
    cargo-unused-features
    cargo-update
    cargo-watch
    clippy
    rust-analyzer
    rustc

    # theme catpucin
    #
    catppuccin-cursors.macchiatoTeal
    catppuccin-gtk
    catppuccin-kvantum
    colloid-icon-theme
    numix-icon-theme-circle

    # UI
    #
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr

    # virtualization
    #
    distrobox
    podman-compose
    podman-tui
    qemu

    # work
    #
    awscli2
    aws-sam-cli
    cmake
    gnumake
    k9s
    slack
  ];

  wayland.windowManager.hyprland.settings.env = [
    # "WLR_DRM_DEVICES,/home/${config.home.username}/.config/hypr/card"
    # "AQ_DRM_DEVICES,/home/${config.home.username}/.config/hypr/card"
    # "AQ_DRM_DEVICES,/dev/dri/card1"
    # "AQ_TRACE,1"
    "HYPLAND_TRACE,1"
    "XDG_SESSION_TYPE,wayland"
    "MOZ_ENABLE_WAYLAND,1"
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

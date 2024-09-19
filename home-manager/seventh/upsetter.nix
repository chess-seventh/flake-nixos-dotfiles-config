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
  };


  home.file = {
    ".config/hypr/macchiato.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/hypr/macchiato.conf";
    ".config/hypr/pyprland.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/hypr/pyprland.toml";

    ".config/avizo/config.ini".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/avizo/config.ini";

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
    pass
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
    git-filter-repo
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

    # Mailing
    #
    notmuch
    neomutt

    # ricing
    #
    fastfetch
    fuzzel
    hyprpaper
    sway
    swaybg
    tmate
    waypaper
    wdisplays
    wl-clipboard
    gnome.gnome-keyring
    moreutils
    imagemagick
    cookiecutter

    # This kinda works but doesn't switch to the new session
    (pkgs.writeShellApplication {
      name = "pux";
      runtimeInputs = [ pkgs.tmux ];
      text = ''
        PRJ="''$(zoxide query -i)"
        echo "Launching tmux for ''$PRJ"
        set -x
        cd "''$PRJ" && \
        TMUX_PRJ="''$(basename "''$PWD" | sed 's#.*/##')" && \
        echo "TMUX Session name: ''$TMUX_PRJ" && \
        exec tmux new-session -A -s "''$TMUX_PRJ"
        '';
    })

    # web & goodies
    #
    firefox
    chromium
    protonmail-bridge
    protonvpn-gui

    # dev tools
    #
    cargo
    devbox
    docker
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

    ## NVIM LSP
    ## nix-ld
    black
    lua-language-server
    pyright
    ruff
    ruff-lsp
    shellcheck
    shfmt
    tflint
    yaml-language-server

    # UNFREE
    #
    jetbrains.pycharm-professional
    obsidian
    spotify
    lutris

    # productivity
    #
    qutebrowser
    taskwarrior
    zathura
    slurp
    grim

    # hyprland
    #
    hyprcursor
    hypridle
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
    kubectl
    slack
    helmfile
    terraform
    terragrunt
    opentofu

    pulumi
    pulumictl
    pulumi-esc

    kubernetes-helm
    (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-s3
          helm-git
        ];
      })

  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

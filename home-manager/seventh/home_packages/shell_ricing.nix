{
inputs,
lib,
pkgs,
config,
...
}: {
  home.packages = with pkgs; [
    alacritty
    aria
    autojump
    bat
    bc
    bottom # System viewer
    cava
    chafa
    cmatrix
    cookiecutter
    cpufetch
    delta
    dig
    direnv
    du-dust
    duf
    eza
    fastfetch
    fd
    felix-fm
    figlet
    fish
    fortune
    fzf
    gh
    git
    git-extras
    git-filter-repo
    gnome.gnome-keyring
    gping
    httpie # Better curl
    imagemagick
    ipfetch
    jq
    just
    kitty
    kmon
    lazygit
    libreoffice
    license-generator
    liquidctl
    lsd
    lsof
    mcfly
    mdcat
    monolith
    moreutils
    mr 
    navi
    ncdu # TUI disk usage
    neofetch
    noti
    octofetch
    oh-my-zsh
    onefetch
    ouch
    pandoc
    pass
    pass-git-helper
    pinentry
    pipes-rs
    pkg-config
    pre-commit
    procs
    progress
    ramfetch
    rewrk
    ripgrep
    rsclock
    sd
    # shell
    speedtest-rs
    starfetch
    taskwarrior
    tealdeer
    texlive.combined.scheme-full
    tgpt
    thefuck
    tmate
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
    zfxtop
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



  ];
}



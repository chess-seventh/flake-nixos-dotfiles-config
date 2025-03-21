{
inputs,
lib,
pkgs,
config,
...
}: {

  home.packages = with pkgs; [
    avizo
    catppuccin-cursors.macchiatoTeal
    catppuccin-gtk
    catppuccin-kvantum
    colloid-icon-theme
    dunst
    feh
    fuzzel
    galculator
    geeqie
    grim
    hyprcursor
    hypridle
    hyprpaper
    hyprpicker
    imv
    keymapp
    mpv
    numix-icon-theme-circle
    obsidian
    pamixer
    pavucontrol
    pulseaudio
    pyprland
    rofi
    rofimoji
    slurp
    starship
    sublime4
    sway
    swaybg
    warp-terminal
    waypaper
    wdisplays
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
    xfce.thunar
    xfce.xfconf
    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    zathura
    zoom-us

    unstable.ferdium

    ## work
    teams-for-linux
    vscode
  ];
}


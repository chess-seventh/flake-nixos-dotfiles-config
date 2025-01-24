{
inputs,
lib,
pkgs,
config,
...
}: {
  home.packages = with pkgs; [
    brave
    chromium
    spotify
    lutris
    slack
    # firefox
    protonmail-bridge
    protonvpn-gui
    qutebrowser
  ];
}



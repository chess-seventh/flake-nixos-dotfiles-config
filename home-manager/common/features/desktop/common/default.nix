{...}: {
  imports = [
    ./adwaita.nix
    ./cursor.nix
    ./discord.nix
    ./firefox.nix
    ./font.nix
    # ./gtk.nix
    ./mpd.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./qt.nix
    ./wpa-gui.nix
  ];

  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;
}

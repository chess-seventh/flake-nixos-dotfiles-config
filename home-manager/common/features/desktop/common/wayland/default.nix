{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./imv.nix
    # ./mako.nix
    ./obsidian.nix
    # ./polkit-gnome-authentication-agent.nix
    ./poweralertd.nix
    ./sway-osd.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    # grim
    # mimeo
    # pulseaudio
    # slurp
    waypipe
    wtype
    wf-recorder
    wl-clipboard
    wofi-emoji
    libsForQt5.kdenlive
    # wl-mirror
    # wl-mirror-pick
    # ydotool
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    # QT_QPA_PLATFORM = "wayland;xcb";
    # LIBSEAT_BACKEND = "logind";
    # NIXOS_OZONE_WL = 1;
  };

  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
}

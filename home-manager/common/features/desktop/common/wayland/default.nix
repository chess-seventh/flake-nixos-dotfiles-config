{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./hypridle.nix
    ./avizo.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./imv.nix
    ./obsidian.nix
    ./poweralertd.nix
    ./sway-osd.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./zathura.nix
  ];


  home.packages = with pkgs; [
    waypipe
    wtype
    wf-recorder
    wl-clipboard
    wofi-pass
    wofi-emoji
    libsForQt5.kdenlive
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };
}

{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./hypridle.nix
    ./avizo.nix
    ./hyprlock.nix
    # ./hyprpaper.nix
    ./imv.nix
    ./obsidian.nix
    ./poweralertd.nix
    ./sway-osd.nix
    ./wallpaper.nix
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
    wofi
    wofi-pass
    wofi-emoji
    libsForQt5.kdenlive
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    EDITOR = "nvim";
    BROWSER = "firefox";
    TZ = "/etc/localtime";
    COLORTERM = "truecolor";
    };
}

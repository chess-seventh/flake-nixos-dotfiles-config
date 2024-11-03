{
  pkgs,
  lib,
  ...
}:
with lib; let
  theme = {
    # name = "catppuccin-mocha"; # Run `nix-shell -p lutgen --command 'lutgen apply -p ""` to see supported color palettes
    name = "gruvbox-dark"; # Run `nix-shell -p lutgen --command 'lutgen apply -p ""` to see supported color palettes
    wallpapers = /home/seventh/Pictures/pics/wallpapers/wallpapers;
  };

  wallpapers = filesystem.listFilesRecursive theme.wallpapers;

  wallpaperBashArray = "(\"${strings.concatStrings (strings.intersperse "\" \"" (map (wallpaper: "${wallpaper}") wallpapers))}\")";
  wallpaperRandomizer = pkgs.writeShellScriptBin "wallpaperRandomizer" ''
    wallpapers=${wallpaperBashArray}
    rand=$[$RANDOM % ''${#wallpapers[@]}]
    wallpaper=''${wallpapers[$rand]}

    monitor=(`hyprctl monitors | grep Monitor | awk '{print $2}'`)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $wallpaper
    for m in ''${monitor[@]}; do
      hyprctl hyprpaper wallpaper "$m,$wallpaper"
    done
  '';
in {
  home.packages = [wallpaperRandomizer];

  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
    };
  };

  systemd.user = {
    services.wallpaperRandomizer = {
      Install = {WantedBy = ["graphical-session.target"];};

      Unit = {
        Description = "Set random desktop background using hyprpaper";
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target"];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${wallpaperRandomizer}/bin/wallpaperRandomizer";
        IOSchedulingClass = "idle";
      };
    };

    timers.wallpaperRandomizer = {
      Unit = {Description = "Set random desktop background using hyprpaper on an interval";};

      Timer = {OnUnitActiveSec = "10min";};

      Install = {WantedBy = ["timers.target"];};
    };
  };
}

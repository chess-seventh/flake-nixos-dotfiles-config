{
pkgs,
lib,
config,
...
}: let
  hyprlock = lib.getExe pkgs.hyprlock;
  loginctl = lib.getExe' pkgs.systemd "loginctl";
  systemctl = lib.getExe' pkgs.systemd "systemctl";
  hyprctl = lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl";
in {
  services.hypridle = {
    enable = false;
    package = pkgs.unstable.hypridle;
    settings = {
      general = {
        lock_cmd = "pidof ${hyprctl} || ${hyprlock}";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "${loginctl} lock-session";    # lock before suspend.
        after_sleep_cmd = "${hyprctl} dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 180;                                # 3min.
          on-timeout = "brightnessctl -s set 15%";        # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r";                 # monitor backlight restore.
        }
        {
          # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
          timeout = 180;                                                # 3min.
          on-timeout = "brightnessctl -sd platform::kbd_backlight set 0"; # turn off keyboard backlight.
          on-resume = "brightnessctl -rd platform::kbd_backlight";        # turn on keyboard backlight.
        }
        {
          timeout = 300;                                 # 5min
          on-timeout = "${loginctl} lock-session";            # lock screen when timeout has passed
        }
        {
          timeout = 350;                                 # 5.83min
          on-timeout = "${hyprctl} dispatch dpms off";        # screen off when timeout has passed
          on-resume = "${hyprctl} dispatch dpms on";          # screen on when activity is detected after timeout has fired.
        }
        {
          timeout = 420;                                 # 7min
          on-timeout = "${systemctl} suspend";                # suspend pc
        }
      ];
    };
  };
}

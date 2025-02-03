{
config,
pkgs,
...
}: {
  programs.waybar = {
    enable = true;
    # package = pkgs.unstable.waybar;
    package = pkgs.waybar;
    systemd = {
      enable = true;
    };

    settings = {
      primary = {
        "layer" = "top";
        "position" = "top";

        "modules-left" = [
          "hyprland/workspaces"
          "custom/right-arrow-dark"
        ];
        "modules-center" = [
          "custom/left-arrow-dark"
          "clock#1"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "clock#2"
          "custom/right-arrow-dark"
          "custom/right-arrow-light"
          "clock#3"
          "custom/right-arrow-dark"
        ];
        "modules-right" = [
          "custom/left-arrow-dark"
          "pulseaudio"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "memory"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "cpu"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "battery"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "disk"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "tray"
        ];

        "custom/left-arrow-dark" = {
          "format" = "";
          "tooltip" = false;
        };
        "custom/left-arrow-light" = {
          "format" = "";
          "tooltip" = false;
        };
        "custom/right-arrow-dark" = {
          "format" = "";
          "tooltip" = false;
        };
        "custom/right-arrow-light" = {
          "format" = "";
          "tooltip" = false;
        };

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "format" = "{name}";
        };

        "clock#1" = {
          "format" = "{:%a %d %b}";
          "tooltip" = false;
        };
        "clock#2" = {
          "format" = "{:%H:%M}";
          "tooltip" = false;
        };
        "clock#3" = {
          "format" = "{:%Y}";
          "tooltip" = false;
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{icon} {volume}%";
          "format-muted" = "";
          "format-icons" = {
            "headphones" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
            ];
          };
          "scroll-step" = 5;
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
        };
        "memory" = {
          "interval" = 5;
          "format" = " {used:0.1f}G/{total:0.1f}G";
          "states" = {
            "warning" = 70;
            "critical" = 90;
          };
          "tooltip" = false;
        };
        "cpu" = {
          "interval" = 5;
          "format" = " {usage}%";
          "format-alt" = " {load}";
          "states" = {
            "warning" = 70;
            "critical" = 90;
          };
          "battery" = {
            "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 15;
            };
            "format-time" = "{H}:{M:02}";
            "format" = "{icon} {capacity}% ({time})";
            "format-charging" = " {capacity} % ({time})";
            "format-charging-full" = " {capacity}%";
            "format-full" = "{icon} {capacity} %";
            "format-alt" = "{icon} {power} W";
            "format-icons" = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
          "disk" = {
            "interval" = 5;
            "format" = "Disk: {percentage_used:2}%";
            "path" = "/";
          };
          "tray" = {
            "icon-size" = 20;
          };
        };
      };
    };

      style = ''
* {
  font-size: 13px;
  font-family: Inconsolata Nerd Font Mono;
}

window#waybar {
  background: #292b2e;
  color: #89DDFF;
}

#custom-right-arrow-dark, #custom-left-arrow-dark {
  color: #2a1a1a;
}

#custom-right-arrow-light, #custom-left-arrow-light {
  color: #292b2e;
  background: #1a1a1a;
}

#workspaces,
#clock.1,
#clock.2,
#clock.3,
#pulseaudio,
#memory,
#cpu,
#battery,
#disk,
#tray {
  background: #1a1a1a;
}

#workspaces button {
  padding: 0 2px;
  color: #fdf6e3;
}

#workspaces button.focused {
  color: #89DDFF;
}

#workspaces button:hover {
  box-shadow: inherit;
  text-shadow: inherit;
}

#workspaces button:hover {
  background: #1a1a1a;
  border: #1a1a1a;
  padding: 0 3px;
}

#pulseaudio {
  color: #268bd2;
}

#memory {
  color: #89DDFF;
}

#cpu {
  color: #268bd2;
}

#battery {
  color: #89DDFF;
}

#disk {
  color: #268bd2;
}

#clock,
#pulseaudio,
#memory,
#cpu,
#battery,
#disk {
  padding: 0 10px;
}
      '';
  };
}

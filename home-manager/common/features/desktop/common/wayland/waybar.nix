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
          "format" = "{icon} {volume:2}%";
          "format-bluetooth" = "{icon}  {volume}%";
          "format-muted" = "MUTE";
          "format-icons" = {
            "headphones" = "";
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
          "format" = "Mem {}%";
        };
        "cpu" = {
          "interval" = 5;
          "format" = "CPU {usage:2}%";
        };
        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}% {time}";
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
          "format" = "Disk {percentage_used:2}%";
          "path" = "/";
        };
        "tray" = {
          "icon-size" = 20;
        };
      };
    };

    # Cheatsheet:
    # x -> all sides
    # x y -> vertical; horizontal
    # x y z -> top, horizontal, bottom
    # w x y z -> top, right, bottom, left

    # base00: "#171D23"
    # base01: "#1D252C"
    # base02: "#28323A"
    # base03: "#526270"
    # base04: "#B7C5D3"
    # base05: "#D8E2EC"
    # base06: "#F6F6F8"
    # base07: "#FBFBFD"
    # base08: "#F7768E"
    # base09: "#FF9E64"
    # base0A: "#B7C5D3"
    # base0B: "#9ECE6A"
    # base0C: "#89DDFF"
    # base0D: "#7AA2F7"
    # base0E: "#BB9AF7"
    # base0F: "#BB9AF7"
    # style = let
    #   inherit (config.colorscheme) palette;
    # in
      /*
css
*/

    style = ''
* {
	font-size: 14px;
  font-family: Iosevka Nerd Font Mono;
}

window#waybar {
	background: #292b2e;
	color: #89DDFF;
}

#custom-right-arrow-dark,
#custom-left-arrow-dark {
	color: #1a1a1a;
}
#custom-right-arrow-light,
#custom-left-arrow-light {
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
	color: #268bd2;
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
	color: #2aa198;
}
#cpu {
	color: #268bd2;
}
#battery {
	color: #2aa198;
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

{
  # lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ../common/wayland
    inputs.hyprland.homeManagerModules.default
  ];

  # services.udev.extraRules = ''
  #   # Your rule goes here
  #   # SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+=""
  #   # SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+=""
  # '';

  # home.packages = with pkgs; [
  #   inputs.hyprwm-contrib.packages.${system}.grimblast
  # ];

  # xdg.portal = with pkgs; {
  #   extraPortals = [inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland];
  #   configPackages = [inputs.hyprland.packages.${system}.hyprland];
  #   xdgOpenUsePortal = true;
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    systemd = {
      enable = true;
    };

    xwayland.enable = true;

    settings = {
      # monitor = "";
      # monitor=",preferred,auto,1.0";
      monitor="eDP-1,preferred,auto,1.0";
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Execute your favorite apps at launch
      # exec-once = "pypr & hyprpaper & waypaper --restore --backend swaybg & ferdium & obsidian & firefox & spotify";
      exec-once = "pypr & hyprpaper & ferdium & firefox & spotify";

      # Source a file (multi-file configs)
      source = "$HOME/.config/hypr/macchiato.conf";

      # debug = {
      #   enable_stdout_logs = true;
      #   disable_logs = false;
      # };

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
          tap-and-drag = true;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      };

      # XWayland disable scaling
      xwayland = {
        force_zero_scaling = true;
      };

      env = [
        # "GDK_SCALE,1.6"
        "HYPRCURSOR_THEME,Catppuccin-Macchiato-Teal"
        "HYPRCURSOR_SIZE,22"
        "XCURSOR_THEME,Catppuccin-Macchiato-Teal"
        "GDK_SCALE,1"
        "XCURSOR_SIZE,22"
        "WLR_NO_HARDWARE_CURSORS,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
      ];

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        # col.active_border = "$teal";
        # col.inactive_border = "$surface1";

        layout = "dwindle";
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;

        blur = {
          size = 8;
          passes = 2;
        };

        drop_shadow = "yes";
        shadow_range = 15;
        shadow_offset = "0, 0";
        shadow_render_power = 3;
        # col.shadow = "$teal";
        # col.shadow_inactive = "0xff$baseAlpha";

        active_opacity = 0.87;
        inactive_opacity = 0.87;
        fullscreen_opacity = 0.87;
      };

      layerrule = "blur, waybar";

      animations = {
        enabled = "yes";

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 3, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
        smart_split = true;
      };

      # master {
      #     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      #     new_is_master = true
      # }

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "on";
      };

      misc = {
        disable_hyprland_logo = "true";
        disable_splash_rendering = "true";
        background_color = "0x24273a";
      };

      binds = {
        workspace_back_and_forth = "true";
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      # device {
      #     # name = epic mouse V1
      #     sensitivity = -0.5
      # }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      windowrule = [
        "opaque, firefox"
        "float, imv"
        "opaque, imv"
        "float, title:(Media viewer)"
        "opaque, title:(Media viewer)"
        "opaque, title:(YouTube Music)"
        "opaque, title:(qutebrowser)"
        "opaque, title:(Slack)"
        "opaque, title:(Spotify)"
        "opaque, telegram"
        "float, mpv"
        "opaque, mpv"
        "opaque, swappy"
        "center 1, swappy"
        "stayfocused, swappy"
        "workspace 2, title:(Firefox)"
        "workspace 2, title:(qutebrowser)"
        "workspace 7, title:(Slack)"
        "workspace 8, title:(Spotify)"
        "workspace 9, title:(Obsidian)"
        "workspace 10, title:(Ferdium)"
        "workspace 2, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false"
        "workspace 8, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false"
        "workspace 9, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false"
        "workspace 10, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false"
        "float, $volume_sidemenu"
        "float, $dropterm"
      ];

      # windowrule = size 50% 50%, mpv
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


      # # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";

      # MOVE ME
      #
      bind = [
        "$mainMod CTRL, l, movewindow, r"
        "$mainMod CTRL, h, movewindow, l"
        "$mainMod CTRL, k, movewindow, u"
        "$mainMod CTRL, j, movewindow, d"
        "$mainMod SHIFT, L, resizeactive, 10 0"
        "$mainMod SHIFT, H, resizeactive, -10 0"
        "$mainMod SHIFT, K, resizeactive, 0 -10"
        "$mainMod SHIFT, J, resizeactive, 0 10"

        # toggles the "term" scratchpad visibility
        "$mainMod SHIFT, T, exec, pypr toggle term"
        # exposes every window temporarily or "jump" to the fucused one
        "$mainMod SHIFT, B, exec, pypr expose"

        # toggle a window from/to the "minimized" special workspace
        "$mainMod SHIFT, N, exec, pypr toggle_special minimized"
        # toggle the "minimized" special workspace visibility
        "$mainMod SHIFT CTRL, N, togglespecialworkspace, minimized"

        "$mainMod CTRL, V, exec, pypr toggle volume"
        "$mainMod CTRL, M, togglespecialworkspace, minimized"
        "$mainMod, M, exec, pypr toggle_special minimized"

        "$mainMod CTRL, E, exec, pypr expose"
        "$mainMod, P, exec, wofi --show drun"

        "$mainMod, T, exec, alacritty"
        "$mainMod SHIFT, ENTER, exec, alacritty"
        "$mainMod SHIFT CTRL, L, exec, hyprlock"

        "$mainMod, C, exec, hyprpicker -a"

        "$mainMod SHIFT, C, exec, pypr menu 'Color picker'"

        "$mainMod CTRL, X, killactive"
        "$mainMod SHIFT, F, togglefloating, "
        "$mainMod CTRL, F, fullscreen, 0"
        # dwindle
        "$mainMod SHIFT, P, pseudo,"
        # dwindle
        "$mainMod SHIFT, O, togglesplit,"
        "$mainMod SHIFT CONTROL, Q, exit,"

        ", XF86AudioRaiseVolume, exec, volumectl -u up"
        ", XF86AudioLowerVolume, exec, volumectl -u down"
        ", XF86AudioMute, exec, volumectl toggle-mute"
        ", XF86AudioMicMute, exec, volumectl -m toggle-mute"

        ", XF86MonBrightnessUp, exec, lightctl up"
        ", XF86MonBrightnessDown, exec, lightctl down"

        # Move focus with mainMod + arrow keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, Tab, cyclenext,"
        "$mainMod, Tab, bringactivetotop,"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        #  $mainMod, 1, exec, $w1

        "$mainMod, 2, workspace, 2"
        #  $mainMod, 2, exec, $w2

        "$mainMod, 3, workspace, 3"
        #  $mainMod, 3, exec, $w3

        "$mainMod, 4, workspace, 4"
        #  $mainMod, 4, exec, $w4

        "$mainMod, 5, workspace, 5"
        #  $mainMod, 5, exec, $w5

        "$mainMod, 6, workspace, 6"
        #  $mainMod, 6, exec, $w6

        "$mainMod, 7, workspace, 7"
        #  $mainMod, 7, exec, $w7

        "$mainMod, 8, workspace, 8"
        #  $mainMod, 8, exec, $w8

        "$mainMod, 9, workspace, 9"
        #  $mainMod, 9, exec, $w9

        "$mainMod, 0, workspace, 10"
        #  $mainMod, 0, exec, $w0

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod SHIFT, E, movewindow, mon:eDP-1"
        "$mainMod SHIFT, W, movewindow, mon:DP-6"

        "$mainMod, E, focusmonitor, eDP-1"
        "$mainMod, W, focusmonitor, DP-6"
      ];

      "$dropterm"  = "^(main_dropterm)$";
      "$volume_sidemenu" = "^(pavucontrol)$";

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];


    };

    # settings = {
    #
    #   monitor = ",highres,auto,auto";
    #
    #   input = {
    #     kb_layout = "us";
    #     kb_variant = "";
    #     kb_model = "";
    #     kb_options = "";
    #     kb_rules = "";
    #     follow_mouse = 1;
    #
    #     touchpad = {
    #       natural_scroll = true;
    #       disable_while_typing = false;
    #     };
    #
    #     sensitivity = 0;
    #   };
    #
    #   # cursor = {
    #   #   no_hardware_cursor = true;
    #   # };
    #
    #   general = {
    #     # See https://wiki.hyprland.org/Configuring/Variables/ for more
    #     gaps_in = 5;
    #     gaps_out = 10;
    #     border_size = 2;
    #     layout = "dwindle";
    #   };
    #
    #   debug = {
    #     disable_logs = false;
    #   };
    #
    #   animations = {
    #     enabled = true;
    #     # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    #     bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
    #
    #     animation = [
    #       "windows, 1, 7, myBezier"
    #       "windowsOut, 1, 7, default, popin 80%"
    #       "windowsMove, 1, 7, myBezier"
    #       "border, 1, 10, default"
    #       "borderangle, 1, 8, default"
    #       "fade, 1, 7, default"
    #       "workspaces, 1, 6, default"
    #     ];
    #   };
    #
    #   dwindle = {
    #     # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    #     pseudotile = true; # master switch for pseudotiling. Enabling is bound to mod + P in the keybinds section below
    #     preserve_split = true; # you probably want this
    #   };
    #
    #   master = {
    #     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    #     # new_is_master = true;
    #   };
    #
    #   misc = {
    #     disable_hyprland_logo = true;
    #     mouse_move_enables_dpms = true;
    #     new_window_takes_over_fullscreen = 2;
    #     key_press_enables_dpms = true;
    #     vrr = 1;
    #   };
    #
    #   decoration = {
    #     drop_shadow = false;
    #   };
    #
    #   xwayland = {
    #     force_zero_scaling = true;
    #   };
    #
    #   gestures = {
    #     # See https://wiki.hyprland.org/Configuring/Variables/ for more
    #     workspace_swipe = true;
    #     workspace_swipe_fingers = 4;
    #   };
    #
    #   windowrulev2 = [
    #     # "float,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$"
    #     # "pin,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$"
    #     # "noinitialfocus,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$"
    #     # "size 76 31,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$"
    #     # "move 0 0,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$"
    #   ];
    #
    #   "$mod" = "SUPER";
    #
    #   bind = let
    #     wlogout = lib.getExe pkgs.wlogout;
    #     wofi = lib.getExe pkgs.wofi;
    #     alacritty = lib.getExe pkgs.alacritty;
    #     firefox = lib.getExe pkgs.firefox;
    #     thunar = lib.getExe pkgs.xfce.thunar;
    #     grimblast = lib.getExe inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast;
    #     workspaces = ["1" "2" "3" "4" "5" "6" "7" "8" "9"];
    #   in
    #     [
    #       "$mod,M,exit,"
    #       "$mod,Return,exec,${alacritty}"
    #       "$mod,Q,killactive,"
    #       "$mod SHIFT,W,exec,${firefox}"
    #       "$mod,E,exec,${thunar}"
    #       "$mod,V,togglefloating,"
    #       "$mod,D,exec,pkill wofi || ${wofi} -S drun"
    #       "$mod,P,pseudo,"
    #       "$mod,J,togglesplit,"
    #       "$mod,escape,exec,pkill wlogout || ${wlogout} -p layer-shell"
    #       "$mod,F,fullscreen"
    #       "$mod,K,exec,${pkgs.wofi-hyprkeys}/bin/wofi-hyprkeys"
    #
    #       "$mod, left, movefocus, l"
    #       "$mod, right, movefocus, r"
    #       "$mod, up, movefocus, u"
    #       "$mod, down, movefocus, d"
    #
    #       "$mod CTRL, left, resizeactive, -5% 0"
    #       "$mod CTRL, right, resizeactive, 5% 0"
    #       "$mod CTRL, up, resizeactive, 0 -5%"
    #       "$mod CTRL, down, resizeactive, 0 5%"
    #
    #       # Scroll through existing workspaces with mod + scroll
    #       "$mod, mouse_down, workspace, e+1"
    #       "$mod, mouse_up, workspace, e-1"
    #
    #       # use main mod alt to move around workspaces
    #       # we use relative workspaces here to make it easier to
    #       "$mod ALT, left, workspace, r-1"
    #       "$mod ALT, right, workspace, r+1"
    #       "$mod ALT, up, workspace, r+1"
    #       "$mod ALT, down, workspace, r-1"
    #
    #       # use mod shift to move (shift haha) an actiuve window
    #       "$mod SHIFT, left, movewindow, l"
    #       "$mod SHIFT, right, movewindow, r"
    #       "$mod SHIFT, up, movewindow, u"
    #       "$mod SHIFT, down, movewindow, d"
    #
    #       ",Print,exec,${grimblast} --notify copy screen"
    #       "SHIFT,Print,exec,${grimblast} --notify save screen"
    #
    #       "CTRL,Print,exec,grimblast --notify copy area"
    #       "CTRL SHIFT,Print,exec,grimblast --notify save area"
    #     ]
    #     ++ (map (n: "$mod,${n},workspace,${n}") workspaces)
    #     ++ (map (n: "$mod SHIFT,${n},movetoworkspacesilent,${n}") workspaces);
    #
    #   bindel = let
    #     swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
    #   in [
    #     ", XF86AudioRaiseVolume, exec, ${swayosd} --output-volume=raise"
    #     ", XF86AudioLowerVolume, exec, ${swayosd} --output-volume=lower"
    #     ", XF86MonBrightnessUp,exec, ${swayosd} --brightness=raise"
    #     ", XF86MonBrightnessDown,exec, ${swayosd} --brightness=lower"
    #   ];
    #
    #   bindl = let
    #     playerctl = lib.getExe' pkgs.playerctl "playerctl";
    #     swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
    #   in [
    #     ", XF86AudioMute, exec, ${swayosd} --output-volume mute-toggle"
    #     ", XF86AudioPrev, exec, ${playerctl} previous"
    #     ", XF86AudioPlay, exec, ${playerctl} play-pause"
    #     ", XF86AudioNext, exec, ${playerctl} next"
    #   ];
    #
    #   bindm = [
    #     "$mod, mouse:272, movewindow"
    #     "$mod, mouse:273, resizewindow"
    #   ];
    # };
  };
}

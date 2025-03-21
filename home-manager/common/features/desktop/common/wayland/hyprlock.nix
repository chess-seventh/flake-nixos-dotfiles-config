{
pkgs,
...
}: {
  programs.hyprlock = {
    enable = true;

    package = pkgs.unstable.hyprlock;

    settings = {
      source = "$home/.config/hypr/macchiato.conf";

      "$accent" = "0xb3$tealAlpha";
      "$accentAlpha" = "$tealAlpha";
      "$font" = "JetBrains Mono Regular";

      # GENERAL
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      # BACKGROUND
      background = {
        monitor = "";
        path = "$HOME/Pictures/pics/wallpapers/wallpapers/";
        blur_passes = 2;
        color = "$base";
      };

      # TIME
      label = [
        {
          monitor = "";
          text = "cmd[update:30000] echo \"$(date +\"%R\")\" ";
          color = "$text";
          font_size = 90;
          font_family = "$font";
          position = "-130, -100";
          halign = "right";
          valign = "top";
          shadow_passes = 2;
        }
        # DATE 
        {
          monitor = "";
          text = "cmd[update:43200000] echo \"$(date +\"%A, %d %B %Y\")\" ";
          color = "$text";
          font_size = 25;
          font_family = "$font";
          position = "-130, -250";
          halign = "right";
          valign = "top";
          shadow_passes = 2;
        }
        # KEYBOARD LAYOUT
        {
          monitor = "";
          text = "$LAYOUT";
          color = "$text";
          font_size = 20;
          font_family = "$font";
          rotate = 0; # degrees, counter-clockwise

          position = "-130, -310";
          halign = "right";
          valign = "top";
          shadow_passes = 2;
        }
      ];

      # USER AVATAR
      image = {
        monitor = "";
        path = "$HOME/.face";
        size = 350;
        border_color = "$accent";
        rounding = -1;

        position = "0, 75";
        halign = "center";
        valign = "center";
        shadow_passes = 2;
      };

      # INPUT FIELD
      input-field = [
        {
          monitor = "";
          size = "400, 70";
          outline_thickness = 4;
          dots_size = "0.2";
          dots_spacing = "0.2";
          dots_center = true;
          outer_color = "$accent";
          inner_color = "$surface0";
          font_color = "$text";
          fade_on_empty = false;
          # placeholder_text = "<span foreground=\"##$textAlpha\"><i>󰌾 Logged in as </i><span foreground=\"##$accentAlpha\">$USER</span></span>";
          placeholder_text = "󰌾 Logged in as $USER";
          hide_input = false;
          check_color = "$accent";
          fail_color = "$red";
          fail_text = "$FAIL (attemps: $ATTEMPTS)";
          # fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "$yellow";
          position = "0, -185";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
        }
      ];

    };
  };
}

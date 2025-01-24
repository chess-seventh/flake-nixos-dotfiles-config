{ ... }:

{
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };


}

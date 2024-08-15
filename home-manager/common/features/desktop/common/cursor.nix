{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = false;
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 18;
  };

  # home.sessionVariables = {
  #   # XCURSOR_THEME = "Adwaita";
  #   # XCURSOR_SIZE = 24;
  #   # HYPRCURSOR_SIZE = 18;
  # };
}

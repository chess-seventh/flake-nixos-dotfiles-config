{ pkgs, ... }:

{
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    # Install the hyprland package from nixpkgs
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;

    # Whether to enable XWayland
    xwayland.enable = true;
  };

}

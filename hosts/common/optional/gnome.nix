{
  config,
  pkgs,
  lib,
  ...
}: {
  specialisation.gnome = {
    inheritParentConfig = true;
    configuration = {
      environment.etc."specialisation".text = "gnome";

      hardware = { 
        xone.enable = true;
      };

      services.joycond.enable = true;

      system.autoUpgrade.enable = lib.mkForce false;

      services.greetd.enable = lib.mkForce false;
      systemd.services.greetd.enable = lib.mkForce false;

      hardware.pulseaudio.enable = false;
      services.xserver.enable = lib.mkForce true;
      services.xserver.displayManager.gdm.enable = lib.mkForce true;
      services.xserver.desktopManager.gnome.enable = lib.mkForce true;

      environment.systemPackages = with pkgs; [gnomeExtensions.appindicator pkgs.adwaita-icon-theme];
      services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];

      environment.gnome.excludePackages =
        (with pkgs; [
          gnome-photos
          gnome-tour
          gedit
        ])
        ++ (with pkgs.gnome; [
          cheese # webcam tool
          gnome-music
          epiphany # web browser
          geary # email reader
          evince # document viewer
          gnome-characters
          totem # video player
          tali # poker game
          iagno # go game
          hitori # sudoku game
          atomix # puzzle game
        ]);
    };
  };
}

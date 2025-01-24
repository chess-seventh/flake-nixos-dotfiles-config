{
  config,
  lib,
  ...
}: {

  virtualisation.docker = {
    enable = true;
    # daemon.settings = {
    #   insecure-registry = "https://192.168.49.2:5000";
    # };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Ensure group exists
  users.groups.docker = {};

  services = {
    printing.enable = true;

    getty.autologinUser = "seventh";

    openssh.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    blueman.enable = true;

    tlp = {
      enable = false;
      settings = {
        DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi";
        DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth";
        DEVICES_TO_ENABLE_ON_UNDOCK = "wifi";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    tailscale.enable = true;

    xserver = {
      enable = true;

      # Configure keymap in X11
      xkb.layout = "us";
      xkb.variant = "";

      # Enable the GNOME Desktop Environment.
      desktopManager.gnome.enable = true;

      displayManager = {
        gdm.enable = true;
        lightdm.enable = false;
      };
    };

    fwupd.enable = true;
    acpid.enable = true;
  };

}

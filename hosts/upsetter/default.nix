{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.omen-15-en1007sa
    # outputs.nixosModules.upsetter
    ./hardware-configuration.nix

    ../common/global
    ../common/users/seventh

    ../common/optional/gnome.nix

    ../common/optional/greetd.nix
    ../common/optional/grub.nix
    ../common/optional/pipewire.nix
    ../common/optional/bluetooth.nix
    ../common/optional/blueman.nix
    ../common/optional/thunar.nix
    ../common/optional/tlp.nix
    ../common/optional/wireless.nix
    # ../common/optional/swaylock.nix
    ../common/optional/hyprlock.nix
    ../common/optional/docker.nix
    ../common/optional/upower.nix
    ../common/optional/virt-manager.nix
    ../common/optional/steam-hardware.nix
    ../common/optional/android.nix
  ];

  networking = {
    networkmanager = {
      enable = lib.mkDefault true;
      insertNameservers = ["1.1.1.1" "1.0.0.1"];
    };
    hostName = "upsetter";
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  # Configure keymap in X11
  # use US keyboard because laptop is in US keyboard layout
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_6_9;

  programs.hyprland.enable = true;

  # steam bullshit
  hardware.opengl = {
    enable = true;
    # driSupport = true;
    # driSupport32Bit = true;
    # extraPackages = with pkgs; [libvdpau-va-gl vaapiVdpau];
  };

  services.logind = {
    lidSwitch = "suspend";
  };

  boot = {
    # we love grub!
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    plymouth.enable = false;
  };

  programs = {
    light.enable = true;
    dconf.enable = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [3000 5173 4173 1522 27017];
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];

  services.udev.packages = [pkgs.swayosd];

  system.stateVersion = "23.05";
}

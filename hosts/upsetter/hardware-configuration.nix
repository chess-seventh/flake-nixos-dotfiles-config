# Do not modify this file!  It was generated by ‘nixos-generate-confignix-shell -p libva-utils --run vainfo’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ pkgs, config, lib, modulesPath, unstablePkgs, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  #   camera not working - seems a problem with latest kernel
  # hardware.ipu6.enable = true;
  # hardware.ipu6.platform = "ipu6ep";

  hardware = {
  
    enableAllFirmware = true;
    acpilight.enable = true;

    ipu6 = {
      enable = false;
      # platform = "ipu6epmtl";
      platform = "ipu6ep";
    };

    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };

    opengl = {
      enable = true;
      # package = unstablePkgs.mesa.drivers;
      package = pkgs.mesa.drivers;
      driSupport = true;
      # package32 = unstablePkgs.pkgsi686Linux.mesa.drivers;
      package32 = pkgs.pkgsi686Linux.mesa.drivers;
      driSupport32Bit = true;
      # extraPackages = with unstablePkgs; [
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiVdpau
        libvdpau-va-gl
        intel-compute-runtime # 8th gen +
      ];
    };

    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };


  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      luks.devices."luks-298baab0-a3a5-4047-8b67-f029dcb5b71d".device = "/dev/disk/by-uuid/298baab0-a3a5-4047-8b67-f029dcb5b71d";
      luks.devices."luks-36243564-61b5-4a6d-9d3b-891a1e6ff056".device = "/dev/disk/by-uuid/36243564-61b5-4a6d-9d3b-891a1e6ff056";

      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ "xe" ];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxKernel.packages.linux_6_9;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

  };


  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a1132835-1edf-451b-8157-d21b997e6e33";
      fsType = "ext4";
    };


  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D8B0-A3CA";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ 
      { device = "/dev/disk/by-uuid/066388a4-bd87-402b-8d42-6195316fe5e7"; }
    ];

  networking.hostName = "upsetter"; # Define your hostname.

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.hardware.bolt.enable = true;

}

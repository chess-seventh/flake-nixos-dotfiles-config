{ lib, ... }:

{
  networking = {
    firewall.checkReversePath = "loose";

    useDHCP = lib.mkDefault true;
    # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable networking
    networkmanager.enable = true;

    hosts = {
      "nixos-01"        = [ "100.78.206.44"   "nixos-01.caracara-palermo.ts.net" ];
      "100.78.206.44"   = [ "nixos-01"        "nixos-01.caracara-palermo.ts.net" ];

      "nixos-02"        = [ "100.93.19.41"    "nixos-02.caracara-palermo.ts.net" ];
      "100.93.19.41"    = [ "nixos-02"        "nixos-02.caracara-palermo.ts.net" ];

      "nixos-03"        = [ "100.108.2.81"    "nixos-03.caracara-palermo.ts.net" ];
      "100.108.2.81"    = [ "nixos-03"        "nixos-03.caracara-palermo.ts.net" ];

      "nixos-blackark"  = [ "100.121.147.69"  "nixos-blackark.caracara-palermo.ts.net" ];
      "100.121.147.69"  = [ "nixos-blackark"  "nixos-blackark.caracara-palermo.ts.net" ];

      "bullwackies"     = [ "100.122.160.144" "bullwackies.caracara-palermo.ts.net" ];
      "100.122.160.144" = [ "bullwackies"     "bullwackies.caracara-palermo.ts.net" ];
    };

    stevenblack = {
      enable = false;
      block = [ "fakenews" "gambling" "porn" ];
    };

  };

  services.rpcbind.enable = true; # needed for NFS

  fileSystems."/home/seventh/mnt/media" = {
    device = "100.122.160.144:/volume1/media";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  fileSystems."/home/seventh/mnt/music" = {
    device = "100.122.160.144:/volume1/music";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  fileSystems."/home/seventh/mnt/books" = {
    device = "100.122.160.144:/volume1/books";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  fileSystems."/home/seventh/mnt/lab" = {
    device = "100.122.160.144:/volume1/lab";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  fileSystems."/home/seventh/mnt/backups" = {
    device = "100.122.160.144:/volume1/backups";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };


  # systemd.mounts = let commonMountOptions = {
  #   type = "nfs";
  #
  #   after = [ "tailscale-autoconnect.service" ];
  #   wants = [ "tailscale-autoconnect.service" ];
  #
  #   mountConfig = {
  #     Options = "noatime";
  #   };
  # };
  #
  # in
  #
  # [
  #   (commonMountOptions // {
  #     what = "100.122.160.144:/volume1/media";
  #     where = "/home/seventh/mnt/media";
  #   })
  #
  #   (commonMountOptions // {
  #     what = "100.122.160.144:/volume1/music";
  #     where = "/home/seventh/mnt/music";
  #   })
  #
  #   (commonMountOptions // {
  #     what = "100.122.160.144:/volume1/books";
  #     where = "/home/seventh/mnt/books";
  #   })
  #
  #   (commonMountOptions // {
  #     what = "100.122.160.144:/volume1/lab";
  #     where = "/home/seventh/mnt/lab";
  #   })
  #
  #   (commonMountOptions // {
  #     what = "100.122.160.144:/volume1/backups";
  #     where = "/home/seventh/mnt/backups";
  #   })
  #
  # ];
  #
  # systemd.automounts = let commonAutoMountOptions = {
  #   wantedBy = [ "multi-user.target" ];
  #   automountConfig = {
  #     TimeoutIdleSec = "60";
  #   };
  # };
  #
  # in
  #
  # [
  #   (commonAutoMountOptions // { where = "/home/seventh/mnt/media"; })
  #   (commonAutoMountOptions // { where = "/home/seventh/mnt/music"; })
  #   (commonAutoMountOptions // { where = "/home/seventh/mnt/books"; })
  #   (commonAutoMountOptions // { where = "/home/seventh/mnt/lab"; })
  #   (commonAutoMountOptions // { where = "/home/seventh/mnt/backups"; })
  # ];

}

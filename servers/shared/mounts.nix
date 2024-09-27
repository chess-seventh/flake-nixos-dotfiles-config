{ ... }:

{
  services.rpcbind.enable = true; # needed for NFS

  fileSystems."/mnt/nfs/media" = {
    device = "100.122.160.144:/volume1/media";
    fsType = "nfs";
  };

  fileSystems."/mnt/nfs/music" = {
    device = "100.122.160.144:/volume1/music";
    fsType = "nfs";
  };

  fileSystems."/mnt/nfs/books" = {
    device = "100.122.160.144:/volume1/books";
    fsType = "nfs";
  };

  fileSystems."/mnt/nfs/lab" = {
    device = "100.122.160.144:/volume1/lab";
    fsType = "nfs";
  };

  fileSystems."/mnt/nfs/backups" = {
    device = "100.122.160.144:/volume1/backups";
    fsType = "nfs";
  };


  systemd.mounts = let commonMountOptions = {
    type = "nfs";

    after = [ "tailscale-autoconnect.service" ];
    wants = [ "tailscale-autoconnect.service" ];

    mountConfig = {
      Options = "noatime";
    };
  };

  in

  [
    (commonMountOptions // {
      what = "100.122.160.144:/volume1/media";
      where = "/mnt/nfs/media";
    })

    (commonMountOptions // {
      what = "100.122.160.144:/volume1/music";
      where = "/mnt/nfs/music";
    })

    (commonMountOptions // {
      what = "100.122.160.144:/volume1/books";
      where = "/mnt/nfs/books";
    })

    (commonMountOptions // {
      what = "100.122.160.144:/volume1/lab";
      where = "/mnt/nfs/lab";
    })

    (commonMountOptions // {
      what = "100.122.160.144:/volume1/backups";
      where = "/mnt/nfs/backups";
    })

  ];

  systemd.automounts = let commonAutoMountOptions = {
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "60";
    };
  };

  in

  [
    (commonAutoMountOptions // { where = "/mnt/nfs/media"; })
    (commonAutoMountOptions // { where = "/mnt/nfs/music"; })
    (commonAutoMountOptions // { where = "/mnt/nfs/books"; })
    (commonAutoMountOptions // { where = "/mnt/nfs/lab"; })
    (commonAutoMountOptions // { where = "/mnt/nfs/backups"; })
  ];
}

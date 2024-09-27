{ pkgs, ... }:

{
  users.motd = ''
 _   _ _____  _____  ____         ___ _____ 
| \ | |_ _\ \/ / _ \/ ___|       / _ \___ / 
|  \| || | \  / | | \___ \ _____| | | ||_ \ 
| |\  || | /  \ |_| |___) |_____| |_| |__) |
|_| \_|___/_/\_\___/|____/       \___/____/ 

  '';

  networking = {
    hostName = "nixos-03"; # Define your hostname.
    firewall.allowedTCPPorts = [ 8080 8181 8686 8989 7878 6443 6789 ];
  };

  environment.systemPackages = [ pkgs.k3s pkgs.sonarr pkgs.radarr pkgs.bazarr pkgs.jackett pkgs.lidarr pkgs.tautulli pkgs.nzbget pkgs.transmission pkgs.plex ];

  services = {
    radarr = {
      enable = true;
      openFirewall = true;
      dataDir = "/mnt/nfs/lab/radarr_data";
    };

    sonarr = {
      enable = true;
      openFirewall = true;
      dataDir = "/mnt/nfs/lab/sonarr_data";
    };

    lidarr = {
      enable = true;
      openFirewall = true;
      dataDir = "/mnt/nfs/lab/lidarr_data";
    };

    prowlarr = {
      enable = true;
      openFirewall = true;
    };

    jackett = {
      enable = true;
      openFirewall = true;
      dataDir = "/mnt/nfs/lab/jackett_data";
    };

    tautulli = {
      enable = true;
      openFirewall = true;
      dataDir = "/mnt/nfs/lab/tautulli_data";
    };

    calibre-server = {
      enable = true;
      libraries =
        [
          "/mnt/nfs/books/magazines"
          # "/mnt/nfs/books/collection"
          # "/mnt/nfs/books/collection_all"
          # "/mnt/nfs/books/_all"
        ];
    };
  };
}


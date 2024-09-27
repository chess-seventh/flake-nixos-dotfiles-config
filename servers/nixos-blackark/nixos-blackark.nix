{ pkgs, ... }:

{
  users.motd = ''
 ____  _        _    ____ _  __    _    ____  _  __
| __ )| |      / \  / ___| |/ /   / \  |  _ \| |/ /
|  _ \| |     / _ \| |   | ' /   / _ \ | |_) | ' / 
| |_) | |___ / ___ \ |___| . \  / ___ \|  _ <| . \ 
|____/|_____/_/   \_\____|_|\_\/_/   \_\_| \_\_|\_\
                                                   
  '';

  networking.hostName    = "nixos-blackark"; # Define your hostname.

  environment.systemPackages = [ pkgs.k3s pkgs.sonarr pkgs.radarr pkgs.bazarr pkgs.jackett pkgs.lidarr pkgs.tautulli pkgs.nzbget pkgs.transmission pkgs.plex ];

  # This is required so that pod can reach the API server (running on port 6443 by default)
  networking.firewall.allowedTCPPorts = [ 6443 6789 32400 ];

  # PLEX
  services.plex = {
    enable = true;
    openFirewall = true;
    # dataDir = "/mnt/nfs/lab/plex_data";
    user = "seventh";
    group = "users";
  };


  services.nzbget = {
    enable = true;
    settings = {
      MainDir="/mnt/nfs/media/downloads";
      DestDir="/mnt/nfs/media/downloads/completed";
      InterDir="/mnt/nfs/media/downloads/intermediate";
      NzbDir="/mnt/nfs/media/downloads/nzb";
      QueueDir="/mnt/nfs/media/downloads/queue";
      TempDir="/mnt/nfs/media/downloads/tmp";
      ScriptDir="/mnt/nfs/media/downloads/scripts";
      LockFile="/mnt/nfs/media/downloads/nzbget.lock";
      LogFile="/mnt/nfs/media/downloads/nzbget.log";
    };
  };

}


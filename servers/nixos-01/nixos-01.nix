{ config, pkgs, ... }:

{
  users.motd = ''
 _   _ _____  _____  ____         ___  _ 
| \ | |_ _\ \/ / _ \/ ___|       / _ \/ |
|  \| || | \  / | | \___ \ _____| | | | |
| |\  || | /  \ |_| |___) |_____| |_| | |
|_| \_|___/_/\_\___/|____/       \___/|_|

  '';

  networking = {
    hostName = "nixos-01"; # Define your hostname.
    firewall.allowedTCPPorts = [ 80 443 5432 ];
  };

  services = {
    taskserver = {
      enable        = true ;
      dataDir       = "/var/lib/taskserver";
      listenHost    = "::";
      requestLimit  = 104857600;
      fqdn          = config.networking.hostName;
      openFirewall  = true;
      trust         = "allow all" ; # "allow all"; # strict
      organisations = {
        Lab = {
          users = [ "Chess7th" ] ;
        };
      };
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql_15;
      ensureDatabases = [ "somedb" ];
      enableTCPIP = true;
      settings = {
        port = 5432;
        listen_addresses =  "*";
      };
      authentication = pkgs.lib.mkOverride 10 ''
    #type database DBuser origin-address auth-method
    local all       all       trust
    host  all       all       ::1/128             trust
    host  all       all       127.0.0.1/32        trust
    host  all       all       100.122.160.144/32  trust
    host  all       all       100.112.242.100/32  trust
    host  all       all       100.78.206.44/32    trust
    host  all       all       100.73.217.11/32    trust
    host  all       all       100.121.147.69/32   trust
    host  all       all       100.108.2.81/32     trust
    host  all       all       100.93.19.41/32     trust
    host  all       all       100.94.51.67/32     trust
    host  all       all       100.98.20.80/32     trust
      '';

      initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE rusty_cv WITH LOGIN PASSWORD 'rusty-cv-01' CREATEDB;
      CREATE DATABASE db_rusty_cv;
      GRANT ALL PRIVILEGES ON DATABASE db_rusty_cv TO rusty_cv;

      CREATE ROLE rusty_ntfy WITH LOGIN PASSWORD 'rusty-ntfy-01' CREATEDB;
      CREATE DATABASE db_rusty_ntfy;
      GRANT ALL PRIVILEGES ON DATABASE db_rusty_ntfy TO rusty_ntfy;
      '';
    };
  };



}


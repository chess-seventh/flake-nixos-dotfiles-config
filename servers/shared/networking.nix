{ ... }:

{
  networking.nameservers = ["8.8.4.4" "100.100.100.100"];
  # networking.domain = "rootbytes.local";

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable                   = true;
    settings.PermitRootLogin = "no";
  };

  networking.stevenblack = {
    enable = true;
    block = [ "fakenews" "gambling" "porn" "social" ];
  };
}

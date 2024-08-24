{ lib, ... }:

{
  networking = {

    useDHCP = lib.mkDefault true;
    # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable networking
    networkmanager.enable = true;

    hosts = {
      "100.78.206.44" = [ "nixos-01" ];
      "100.93.19.41" = [ "nixos-02" ];
      "100.108.2.81" = [ "nixos-03" ];
      "100.122.160.144" = [ "bullwackies" ];
    };

    stevenblack = {
      enable = false;
      block = [ "fakenews" "gambling" "porn" ];
    };

  };

}

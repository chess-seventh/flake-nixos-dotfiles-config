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

}

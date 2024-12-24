{ lib, ... }:

{

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config = {
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];

      sandbox = false;

      # Allow unfree packages
      allowUnfree = true;
    };
  };


  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "seventh" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

}

{
  description = "NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nix-colors = {
      url = "github:misterio77/nix-colors";
    }; 

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ###
    # Unstable
    ###

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/hyprland";
      # rev = "f642fb97df5c69267a03452533de383ff8023570";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.aquamarine.follows = "aquamarine";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprkeys = {
      url = "github:hyprland-community/hyprkeys";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      # this line assume that you also have nixpkgs as an input
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    nix-ld,
    ...
    } @ inputs: let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux"];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

      mkNixos = modules:
        nixpkgs.lib.nixosSystem {
          inherit modules;
        #   modules = [
        # # ... add this line to the rest of your configuration modules
        #     nix-ld.nixosModules.nix-ld
        #
        #   # The module in this repository defines a new module under (programs.nix-ld.dev) instead of (programs.nix-ld)
        #   # to not collide with the nixpkgs version.
        #   { programs.nix-ld.dev.enable = true; }
        #   ];
          specialArgs = {inherit inputs outputs;};
        };

      mkHome = modules: pkgs:
        home-manager.lib.homeManagerConfiguration {
          inherit modules pkgs;
          extraSpecialArgs = {inherit inputs outputs;};
        };
    in {
      # nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      formatter = forEachPkgs (pkgs: pkgs.alejandra);

      overlays = import ./overlays {inherit inputs outputs;};

      devShells = forEachPkgs (pkgs: import ./shell.nix {inherit pkgs;});

      nixosConfigurations = {
        upsetter = mkNixos [./hosts/upsetter];
      };

      homeConfigurations = {
        "seventh@upsetter" = mkHome [./home-manager/seventh/upsetter.nix] nixpkgs.legacyPackages."x86_64-linux";
      };
    };
}

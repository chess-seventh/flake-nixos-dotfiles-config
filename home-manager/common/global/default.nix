{
inputs,
lib,
pkgs,
config,
outputs,
...
}: {
  imports =
    [
      inputs.impermanence.nixosModules.home-manager.impermanence
      ../features/cli
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "nix-2.15.3"
        "electron-25.9.0"
        "openssl-1.1.1w"
      ];
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };

  home = {
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "23.05";
    sessionPath = ["$HOME/.local/bin" "$HOME/.cargo/bin"];
  };

  colorscheme = inputs.nix-colors.colorSchemes.tokyo-city-terminal-dark;
  home.file.".colorscheme".text = config.colorscheme.slug;

  programs = {
    home-manager.enable = true;
    git.enable = true;
    gpg.enable = false;
  };

}

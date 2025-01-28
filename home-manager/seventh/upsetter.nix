# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
inputs,
lib,
pkgs,
config,
...
}: {
  # You can import other home-manager modules here
  imports = [
    inputs.nix-colors.homeManagerModule
    ../common/global
    ../common/features/nvim
    ../common/features/desktop/hyprland
    ./home_packages
    ./home_files.nix
  ];

  home = {
    username = lib.mkDefault "seventh";
  };

  # Laptop specific configuration

  home.sessionPath = [
    "$HOME/.cargo/bin/"
  ];

  # home.sessionVariables = {
  #   EDITOR = "nvim";
  # };


  home.packages = with pkgs; [
    # Mailing
    #
    aerc
    alot
    msmtp
    neomutt
    notmuch
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

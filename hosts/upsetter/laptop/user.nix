{ pkgs, ...}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.seventh = {
    isNormalUser = true;
    description = "Franci";

    extraGroups = [ "networkmanager" "wheel" "docker" ];

    shell = pkgs.zsh;

    packages = with pkgs; [
      alacritty
      btop
      gcc
      htop
      kitty
      ripgrep
      seatd
      tree
      unzip
      wget
      zsh
      gnupg
    ];

  };

  programs = {
    gnupg = {
      # enable = false;
      agent = {
        enable = true;
        enableSSHSupport = true;
        # enableExtraSocket = true;
        # enableBrowserSocket = true;
        pinentryPackage = pkgs.pinentry-gnome3;
      };
    };
  };

  # programs.gpg = {
  # };



}

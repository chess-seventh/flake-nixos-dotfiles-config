{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # stable
    acpi
    alacritty
    btop
    fwupd
    gcc
    htop
    kitty
    lm_sensors
    lm_sensors
    networkmanagerapplet
    ripgrep
    tailscale
    tree
    unzip
    wget
    zsh
  ];

  programs.zsh.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.multipass.enable = true;
  # programs.multipass.enable = true;

}


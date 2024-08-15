{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  # users.mutableUsers = false;
  users.users.seventh = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups =
      [
        "wheel"
        "video"
        "audio"
        "adbusers"
        "kvm"
        "adbgroup"
      ]
      ++ ifTheyExist [
        "network"
        "networkmanager"
        "wireshark"
        "git"
        "libvirtd"
        "docker"
        "kvm"
      ];

    # openssh.authorizedKeys.keys = [(builtins.readFile ../ssh.pub)];
    # hashedPasswordFile = config.sops.secrets.seventh-password.path;
    packages = [
      pkgs.home-manager
    ];
  };

  # sops.secrets.seventh-password = {
  #   sopsFile = ../../secrets.yaml;
  #   neededForUsers = true;
  # };

  home-manager.users.seventh = import ../../../../home-manager/seventh/${config.networking.hostName}.nix;
  programs.zsh.enable = true;

  services.geoclue2.enable = true;
}

{
pkgs,
config,
...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {

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

  services.geoclue2.enable = true;
  services.gnome3.gnome-keyring.enable = true;

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # programs.nix-ld.libraries = with pkgs; [
  #   black
  #   lua-language-server
  #   # lua_ls
  #   pyright
  #   # pyright-langserver
  #   ruff
  #   ruff-lsp
  #   shellcheck
  #   shfmt
  #   tflint
  #   yaml-language-server
  # ];
  # security.pam.services.lightdm.enableGnomeKeyring = true;
  # ssh.startAgent = true;

}

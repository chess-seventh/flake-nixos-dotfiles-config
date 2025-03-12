{
  config,
  outputs,
  lib,
  ...
}: let
  hostnames = builtins.attrNames outputs.nixosConfigurations;
in {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "work" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "/home/seventh/.ssh/id_ecdsa";
      };

    };
    # matchBlocks = {
    #   net = {
    #     host = builtins.concatStringsSep " " hostnames;
    #     forwardAgent = true;
    #     #  remoteForwards = [{
    #     #    bind.address = ''/%d/.gnupg-sockets/S.gpg-agent'';
    #     #    host.address = ''/%d/.gnupg-sockets/S.gpg-agent.extra'';
    #     # }];
    #   };
    # };
  };

  # services.ssh-agent.enable = true;

  # home.persistence = {
  #   "/home/${config.home.username}".directories = [".ssh"];
  # };
}

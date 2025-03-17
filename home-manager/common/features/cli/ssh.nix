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
      # "gitlab.com:signicat" = {
      "work" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "/home/seventh/.ssh/id_ecdsa";
      };
      "sesam-rct" = {
        hostname = "10.55.5.250";
        user = "user";
        identityFile = "/home/seventh/.ssh/id_ecdsa";
      };
      "sesam-prod" = {
        hostname = "10.55.6.250";
        user = "user";
        identityFile = "/home/seventh/.ssh/id_ecdsa";
      };
      "sesam-rct2" = {
        hostname = "10.55.16.250";
        user = "user";
        identityFile = "/home/seventh/.ssh/id_ecdsa";
      };
      "sesam-dev" = {
        hostname = "10.55.26.250";
        user = "user";
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

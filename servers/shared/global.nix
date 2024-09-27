{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    autojump
    btop
    curl
    direnv
    eza
    figlet
    fzf
    git
    htop
    nfs-utils
    nmap
    pciutils
    pre-commit
    rxvt_unicode.terminfo
    tailscale
    tmux
    tree
    wget
    z-lua
    zsh
  ];

  programs.direnv.enable = true;

  services = {
    # Do not enable the X11 windowing system.
    xserver.enable = false;

    # Configure keymap in X11
    xserver.xkb.layout = "us";

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable prometheus exporter for base metrics
    prometheus.exporters.node = {
      enable = true;
      port = 9100;

      enabledCollectors = [
        "logind"
        "systemd"
      ];

      disabledCollectors = [
        "textfile"
      ];

      openFirewall = true;
      firewallFilter = "-i br0 -p tcp -m tcp --dport 9100";
    };

    tailscale = {
      enable = true;
      port = 41641;
    };

  };

  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";

    # make sure tailscale is running before trying to connect to tailscale
    after = [ "network-pre.target" "tailscale.service" ];
    wants = [ "network-pre.target" "tailscale.service" ];
    wantedBy = [ "multi-user.target" ];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script
    script = with pkgs; ''
      # wait for tailscaled to settle
      sleep 2

      # check if we are already authenticated to tailscale
      status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
        exit 0
      fi

      # otherwise authenticate with tailscale
      ${tailscale}/bin/tailscale up -authkey tskey-auth-kiLDSV3CNTRL-3bHPWun2yyDNDk2DdXE3yDfpN8tBxEDoC
    '';
  };

  networking.firewall = {
    enable = true;

    checkReversePath = "loose";

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    allowedTCPPorts = [ 22 80 443 892 2049 6443 6789 8080 8181 8686 8989 7878 41641 9100 5432 ];

  };

  nixpkgs.config.allowUnfree = true;

}

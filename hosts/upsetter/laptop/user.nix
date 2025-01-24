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
      agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-gnome3;
      };
    };
  };

  # programs.gpg = {
  # };
  # Enable cron service

  # services.cron = {
  #   enable = true;
  #   systemCronJobs = [
  #     "0 * * * *      seventh    python /home/seventh/src/github.com/dunst-timer/dunst-timer.py -d 25m -t '🍅 Pomodoro' -p"
  #     "30 * * * *      seventh    python /home/seventh/src/github.com/dunst-timer/dunst-timer.py -d 25m -t '🍅 Pomodoro' -p"
  #     "25 * * * *      seventh    python /home/seventh/src/github.com/dunst-timer/dunst-timer.py -d 5m -t '☕ Break' -p"
  #     "55 * * * *      seventh    python /home/seventh/src/github.com/dunst-timer/dunst-timer.py -d 5m -t '☕ Break' -p"
  #   ];
  # };

}

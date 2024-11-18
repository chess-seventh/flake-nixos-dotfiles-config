{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
        scan_timeout = 5000;
        command_timeout = 3600000;
    };
  };
}

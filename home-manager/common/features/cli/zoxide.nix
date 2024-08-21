{pkgs, ...}: {
  programs.zoxide = {
    package = pkgs.unstable.zoxide;
    enable = false;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
      "--hook pwd"
    ];
  };
}

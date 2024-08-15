{pkgs, ...}: {
  programs.zoxide = {
    package = pkgs.unstable.zoxide;
    enable = false;
  };
}

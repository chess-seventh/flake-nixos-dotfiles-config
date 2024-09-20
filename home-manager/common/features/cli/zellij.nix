{ ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "gruvbox-dark";
      # themes.custom.fg = "#ffffff";
    };
  };
}


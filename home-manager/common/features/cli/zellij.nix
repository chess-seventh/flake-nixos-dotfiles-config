{ ... }: {
# https://github.com/zellij-org/zellij/blob/main/zellij-utils/assets/config/default.kdl
# https://zellij.dev/documentation/keybindings
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "gruvbox-dark";
    };
  };
}


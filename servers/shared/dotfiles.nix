{ pkgs, ... }:

{

services.cron = {
    enable = true;
    systemCronJobs = [
      "30 7 * * *   seventh   /home/seventh/.cargo/bin/rusty-ntfy"
      "30 18 * * *   seventh   /home/seventh/.cargo/bin/rusty-ntfy"
    ];
  };

  # ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      la = "eza -lgbma --icons=always";
      ll = "eza -lgbma --icons=always";
      ls = "eza -lgbm --icons=always";
      l = "eza -lgbm --icons=always";

      lad = "eza -lgbtmad --icons=always";
      laf = "eza -lgbtmaf --icons=always";

      df = "df -h";
      bigdirs = "du -h -a -d 1 ./ | sort -h -r | head -n 10";

      tree2 = "eza --tree --level 2";
      tree3 = "eza --tree --level 3";

    };

    shellInit = ''
        export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
        eval "$(direnv hook zsh)"
    '';

    histSize = 1000000;
    histFile = "$HOME/.zsh_history";

    zsh-autoenv = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;

      highlighters = [
        "line"
      ];
    };

    autosuggestions = {
      enable = true;

      strategy = [ "history" ];
    };

    ohMyZsh = {
      enable = true;

      plugins = [
        "ag"
        "aliases"
        "autojump"
        "autoenv"
        "branch"
        "colored-man-pages"
        "colorize"
        "common-aliases"
        "command-not-found"
        "git"
        "git-auto-fetch"
        "git-extras"
        "git-prompt"
        "fzf"
        "emoji"
        "gnu-utils"
        "history"
        "history-substring-search"
        "man"
        "python"
        "pip"
        "pipenv"
        "rsync"
        "tig"
        "themes"
        "taskwarrior"
        "sudo"
        "tmux"
        "vi-mode"
        "zsh-interactive-cd"
        "zsh-navigation-tools"
      ];

      theme   = "strug";
    };
  };

  # ZSH AUTOJUMP
  programs.autojump = {
    enable = true;
  };

  # TMUX
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    keyMode  = "vi";
    clock24  = true;

    aggressiveResize = true;

    plugins = with pkgs.tmuxPlugins; [
      resurrect
      sidebar
      sessionist
      fzf-tmux-url
      tmux-fzf
      better-mouse-mode
      continuum
      power-theme
      urlview
    ];
  };

  # NEOVIM
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    vimAlias      = true;
    viAlias       = true;

    withPython3 = true;
    withNodeJs  = false;
  };


}

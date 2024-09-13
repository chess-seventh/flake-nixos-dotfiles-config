{ pkgs, config, ... }:

{
  programs.tmux = {

    enable = true;
    shortcut = "a";
    aggressiveResize = true;
    newSession = false;
    escapeTime = 0;
    secureSocket = false;
    mouse = true;

    keyMode = "vi";
    clock24 = true;
    historyLimit = 5000000;
    prefix = "C-a";

    sensibleOnTop = false;

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
        run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux

        set -g @resurrect-strategy-vim 'session'
        set -g @resurrect-capture-pane-contents 'on'
        set -g @resurrect-save 'S'
        set -g @resurrect-restore 'R'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          run-shell ${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux

          set -g @continuum-boot 'on'
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.tmux-fzf;
        extraConfig = ''
          bind-key "w" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/window.sh switch"
          bind-key "C-w" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/window.sh rename"
        '';
      }
      {
        plugin = tmuxPlugins.tmux-colors-solarized;
        extraConfig = ''
          set -g @solarized 'dark'
        '';
      }
      tmuxPlugins.fzf-tmux-url
      tmuxPlugins.sessionist
      tmuxPlugins.sidebar
      tmuxPlugins.tmux-colors-solarized
      tmuxPlugins.yank
    ];

    extraConfig = ''
      source-file ${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmux/tmux_keybindings.conf
      source-file ${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmux/tmux_options.conf
      source-file ${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/tmux/tmux_status_bar.conf
    '';
  };
}


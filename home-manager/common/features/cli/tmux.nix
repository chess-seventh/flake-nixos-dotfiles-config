{ pkgs, ... }:

{
  programs.tmux = {

    enable = true;
    shortcut = "a";
    aggressiveResize = true;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    terminal = "tmux-256color";
    keyMode = "vi";
    clock24 = true;
    historyLimit = 5000000;
    baseIndex = 1;

    plugins = with pkgs; [
      tmuxPlugins.tmux-fzf
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.sessionist
      tmuxPlugins.fzf-tmux-url
      tmuxPlugins.yank
      tmuxPlugins.tmux-colors-solarized
      tmuxPlugins.sidebar
      tmuxPlugins.catppuccin
    ];

    extraConfig = ''

unbind %
unbind '"'
unbind p
unbind m

# Mouse works as expected
set-option -g mouse on
# easy-to-remember split pane commands
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

# current window navigation:
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# resizing:
bind-key -r C-h resize-pane -L
bind-key -r C-j resize-pane -D
bind-key -r C-k resize-pane -U
bind-key -r C-l resize-pane -R

# splitting and cycling:
# bind-key - split-window -h
# bind-key = split-window -v

bind-key u last-window
bind-key C-n next-window
bind-key C-p previous-window

bind Escape copy-mode
bind p paste-buffer

bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'V' send -X select-line
bind-key -T copy-mode-vi 'r' send -X rectangle-toggle
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -in -selection clipboard"

# moving between panes with vim movement keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# move the current pane TO become a new window
bind T break-pane

bind B command-prompt -p "Send pane BACK to: " "join-pane -h -t '%%'"

## swapping:
bind-key J swap-pane -D
bind-key K swap-pane -U
bind-key H swap-pane -U
bind-key L swap-pane -D

# rotate layout with `C-r`
bind -r C-r next-layout

# Use F10 to toggle zoom the current pane
bind-key -n F10 resize-pane -Z

# moving between windows with vim movement keys
# Press the prefix (Ctrl+a) then hold Ctrl key and press h or l to cycle through
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# Use Ctrl+[0..9] to select window in tmux
bind -n C-0 select-window -t :10
bind -n C-1 select-window -t :1
bind -n C-2 select-window -t :2
bind -n C-3 select-window -t :3
bind -n C-4 select-window -t :4
bind -n C-5 select-window -t :5
bind -n C-6 select-window -t :6
bind -n C-7 select-window -t :7
bind -n C-8 select-window -t :8
bind -n C-9 select-window -t :9
bind -n C-Tab last-window

# resize panes with similar key binding with my vim settings
bind -r M-h resize-pane -L 5
bind -r M-j resize-pane -D 5
bind -r M-k resize-pane -U 5
bind -r M-l resize-pane -R 5


# Mouse selection

# Toggle mouse on/off
bind-key m set-option -gF mouse "#{?mouse,off,on}" ; display-message "#{?mouse,Mouse: ON,Mouse: OFF}"
    '';

  };
}



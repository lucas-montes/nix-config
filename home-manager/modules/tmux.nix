{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    plugins = [
      pkgs.tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      set -g set-clipboard on
      set-option -g status-position top

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Plugin name: tmux-minimal-rounded

      # Top status bar
      set-option -g status-position top

      # Background and font
      set-option -g status-bg "#000000"
      set-option -g status-fg "#ffffff"
      set-option -g status-style "bg=#000000,fg=#ffffff"

      # Rounded separators and info
      set-option -g status-left "#S"
      set-option -g status-right "#{pane_index} | #{pane_current_command}"

      # Style for window list
      setw -g window-status-format "#I:#W"
      setw -g window-status-current-format "#[bold] #I:#W #[nobold]"
      setw -g window-status-current-style "bg=#44475a,fg=#f8f8f2"

      # Message styling (optional)
      set-option -g message-style "fg=#00ffff,bg=#222222,align=centre"
      set-option -g message-command-style "fg=#00ffff,bg=#222222,align=centre"

      # Copy mode highlight
      set-option -g mode-style "bg=#44475a,bold"
    '';
  };
}

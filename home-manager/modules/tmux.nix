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


      set-option -g default-terminal "screen-256color"
      set-option -ga terminal-overrides ",xterm-256color:Tc"


      base="#1e1e2e"
      crust="#11111b"

      # Text colors
      text="#cdd6f4"
      subtext0="#a6adc8"

      blue="#89b4fa"
      green="#a6e3a1"
      yellow="#f9e2af"
      peach="#fab387"
      red="#f38ba8"
      mauve="#cba6f7"

      # Status bar background and foreground
      set-option -g status-style "bg=$base,fg=$text"
      set-option -g status-left-length 40
      set-option -g status-right-length 100

      # Left side: Session name with rounded style
      set-option -g status-left "#[bg=$blue,fg=$crust,bold] #S #[bg=$base,fg=$blue]"
      # set-option -g status-left "#S" previous

      # Right side: Time and date with
      set-option -g status-right "#[fg=$peach]#[bg=$peach,fg=$crust] %H:%M #[bg=$base,fg=$peach]#[fg=$green]#[bg=$green,fg=$crust] %d-%b #[bg=$base,fg=$green]"
      # set-option -g status-right "#{pane_index} | #{pane_current_command}" # previous


      # Window status format (inactive windows)
      setw -g window-status-format "#[fg=$subtext0] #I:#W#{?window_zoomed_flag, ,} "
      # setw -g window-status-format "#I:#W" #previous

      # Current window status format (active window)
      setw -g window-status-current-format "#[bg=$mauve,fg=$crust,bold] #I:#W#{?window_zoomed_flag, ,} #[bg=$base,fg=$mauve]"
      # setw -g window-status-current-format "#[bold] #I:#W #[nobold]" #previous

      # setw -g window-status-current-style "bg=#44475a,fg=#f8f8f2"

      # Window status separator
      setw -g window-status-separator ""

      # Pane borders
      set-option -g pane-border-style "fg=$surface0"
      set-option -g pane-active-border-style "fg=$blue"

      # Message styling
      set-option -g message-style "bg=$blue,fg=$crust,bold"
      set-option -g message-command-style "bg=$red,fg=$crust,bold"

      # # Message styling (previous)
      # set-option -g message-style "fg=#00ffff,bg=#222222,align=centre"
      # set-option -g message-command-style "fg=#00ffff,bg=#222222,align=centre"


      # Copy mode highlight
      set-option -g mode-style "bg=$yellow,fg=$crust,bold"

      # Clock mode color
      setw -g clock-mode-colour "$blue"

      # Bell styling
      setw -g window-status-bell-style "bg=$red,fg=$crust,bold"

      # Activity styling
      setw -g window-status-activity-style "bg=$yellow,fg=$crust,bold"
    '';
  };
}

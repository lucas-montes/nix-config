{pkgs, config, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    plugins = [
      pkgs.tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      unbind r
      bind r source-file ${config.xdg.configHome}/tmux/tmux.conf \; display-message "Config reloaded!"

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


      base="#${config.lib.stylix.colors.base00}"
      crust="#${config.lib.stylix.colors.base05}"

      # Text colors
      text="#${config.lib.stylix.colors.base05}"
      subtext0="#${config.lib.stylix.colors.base03}"

      blue="#${config.lib.stylix.colors.base0D}"
      green="#${config.lib.stylix.colors.base0F}"
      yellow="#${config.lib.stylix.colors.base07}"
      peach="#${config.lib.stylix.colors.base09}"
      red="#${config.lib.stylix.colors.base08}"
      mauve="#${config.lib.stylix.colors.base0E}"

      # Status bar background and foreground
      set-option -g status-style "bg=$base,fg=$text"
      set-option -g status-left-length 40
      set-option -g status-right-length 100

      setw -g window-status-style "fg=$subtext0,bg=$base"

      # Left side: Session name with rounded style
      set-option -g status-left "#[fg=$blue,bg=$base]#[bg=$blue,fg=$crust,bold] #S #[fg=$blue,bg=$base,nobold]"
      # set-option -g status-left "#S" previous

      # Right side: Time and date with
      set-option -g status-right "#[fg=$green,bg=$base]#[bg=$green,fg=$crust] %d-%b #[fg=$peach,bg=$green]#[bg=$peach,fg=$crust] %H:%M #[fg=$peach,bg=$base]"
      #set-option -g status-right "#{pane_index} | #{pane_current_command}" # previous


      # Window status format (inactive windows)
      setw -g window-status-format "#[fg=$subtext0] #I:#W#{?window_zoomed_flag, ,} "
      # setw -g window-status-format "#I:#W" #previous

      # Current window status format (active window)
      setw -g window-status-current-format "#[bg=$mauve,fg=$crust,bold] #I:#W#{?window_zoomed_flag, ,} #[bg=$base,fg=$mauve]"
      # setw -g window-status-current-format "#[bold] #I:#W #[nobold]" #previous

      setw -g window-status-current-style "fg=$crust,bg=$mauve"

      # Window status separator
      setw -g window-status-separator ""

      # Pane borders
      set-option -g pane-border-style "fg=$peach"
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

{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    newSession = true;
    keyMode = "vi";
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.catppuccin
    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      set -g set-clipboard on
      set-option -g status-position top

      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator " "
      set -g @catppuccin_window_middle_separator " █"
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W"
      set -g @catppuccin_status_modules_right "session"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_directory_text "#{pane_current_path}"
      set -g @catppuccin_status_background "#b45bcf"
    '';
  };

  #  programs.tmate = {
  #    enable = true;
  #    # FIXME: This causes tmate to hang.
  #    # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  #  };
}

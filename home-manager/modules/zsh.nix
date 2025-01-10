{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "virtualenv" "direnv"];
      theme = "agnoster";
    };

    shellAliases = {
      v = "nvim";
      se = "sudoedit";
      docclean = "docker system prune -a --volumes --force";
      sukb = "setxkbmap us";
      slkb = "setxkbmap latam";
      cprsync = "rsync -chavzP --stats --progress";
      con-ap = "bluetoothctl connect F8:4D:89:37:41:A0";
    };

    history.size = 10000;
    history.path = "$HOME/dump/zsh/history";

    initExtra = ''
      # Start UWSM
      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';
  };
}

{pkgs, ...}:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
      theme = "agnoster";
    };

    shellAliases = {
      v = "nvim";
      se = "sudoedit";
      docclean = "docker system prune -a --volumes --force";
      cprsync = "rsync -chavzP --stats --progress";
      con-ap = "bluetoothctl connect F8:4D:89:37:41:A0";
      ro = "sudo nixos-rebuild switch --flake";
      ru = "home-manager switch --flake";
    };

    plugins = [
        {
          name = "you-should-use";
          src = pkgs.zsh-you-should-use;
          file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
        }
      ];

    history.size = 10000;
    history.path = "$HOME/dump/zsh/history";

    initExtra = ''
          # 96eb8f124fd851174b28edf645fb4b83f4b32e59 check to find the if condition to launch tmux
      # if [ -n "$DISPLAY" ]; then
      #   neofetch
      # fi


      # Start UWSM
      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';
  };
}

{pkgs, ...}:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
      theme = "agnoster";
    };

    shellAliases =let hey = "hey"; in {
      se = "sudoedit";
      docclean = "docker system prune -a --volumes --force";
      cprsync = "rsync -chavzP --stats --progress";
      con-ap = "bluetoothctl connect F8:4D:89:37:41:A0";
      ro = "sudo nixos-rebuild switch --flake";
      ru = "home-manager switch --flake";
      es = "vim $HOME/.dotfiles/";
      rs = "ru $HOME/.dotfiles";
      notes = "cd $HOME/Notes/ && vim .";
      spj = "$(cp -R ~/.dotfile/templates/rust $1 && cd $1)";
      venv = "nix-shell --command zsh";
    };

    plugins = [
        {
          name = "you-should-use";
          src = pkgs.zsh-you-should-use;
          file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
        }
      ];

    history.size = 10000;

    initExtra = ''
      # 96eb8f124fd851174b28edf645fb4b83f4b32e59 check to find the if condition to launch tmux

      # Start UWSM
      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';
  };
}

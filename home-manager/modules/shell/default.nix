{pkgs, ...}: let
  dotfiles = "$HOME/.dotfiles";
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = false;
    autocd = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
      theme = "agnoster";
    };

    shellAliases = {
      se = "sudoedit";
      docclean = "docker system prune -a --volumes --force";
      cprsync = "rsync -chavzP --stats --progress";
      con-ap = "bluetoothctl connect F8:4D:89:37:41:A0";
      ro = "sudo nixos-rebuild switch --flake";
      ru = "home-manager switch --flake";
      es = "vim ${dotfiles}";
      rs = "ru ${dotfiles}";
      notes = "cd $HOME/Notes/ && vim .";
      spj = "$(cp -R ~/.dotfile/templates/rust $1 && cd $1)";
      venv = "nix-shell --command zsh";
      tx = "_new_named_session";
      gpj = "_fzf_tmux ~/Projects/";
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
      _fzf() {
              find $@ \( -name ".direnv" -o -name "venv" -o -name "*cache*" -o -name ".git" -o -name "build" -o -name "target" \) -prune -o -type f -o -type d -print | fzf
      }
      _fzf_tmux() {
              _new_named_session "$(_fzf $@)"
      }
      _new_named_session() {
              if [[ -d $1 || -f $1 ]]; then
                      name=$(basename "$1" | tr . _)
                      dir_to_go=$(realpath "$1")
              else
                      echo "WTF $1"
                      return 1
              fi
              tmux_running=$(pgrep tmux)

              if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
                      tmux new-session -s "$name" -c "$dir_to_go"
                      tmux attach -t "$name"
                      return 0
              fi

              if ! tmux has-session -t="$name" 2>/dev/null; then
                      tmux new-session -ds "$name" -c "$dir_to_go"
              fi

              tmux switch-client -t "$name"
      }

      # Start UWSM
      if uwsm check may-start > /dev/null && uwsm select; then
              exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';
  };
}

{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
    enable = true;
    plugins = [ "git" "you-should-use" "virtualenv" ];
    theme = "agnoster";
  };

    shellAliases = {
        v = "nvim";
        se = "sudoedit";
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

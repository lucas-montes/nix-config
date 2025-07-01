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
    };

    shellAliases = {
      se = "sudoedit";
      docclean = "docker system prune -a --volumes --force";
      cprsync = "rsync -chavzP --stats --progress";
      con-ap = "bluetoothctl connect F8:4D:89:37:41:A0";
      ro = "sudo nixos-rebuild switch --flake";
      ru = "home-manager switch --flake";
      es = "cd ${dotfiles} && vim .";
      rs = "ru ${dotfiles} && source $HOME/.zshrc && tmux source $HOME/.config/tmux/tmux.conf";
      notes = "tx $HOME/Notes/";
      venv = "nix-shell --command zsh";
      tx = "_new_named_session";
      nrp = "_new_project";
      gpj = "_fzf_tmux ~/Projects/";
      dw-venv = "venv -p yt-dlp";
      dwm = "yt-dlp -x --audio-format mp3 -o '$HOME/Downloads/music/%(title)s.%(ext)s'";
      lz = "lazygit";
      open = "xdg-open";
    };

    plugins = [
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
    ];

    history.size = 10000;

    initContent = builtins.readFile ./initExtra.sh;
  };
}

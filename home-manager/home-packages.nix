{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fzf
    ripgrep
    unzip
    zip
    kitty
    vscode
    brave
    dolphin

    nodejs
    python312

    # WM stuff
    playerctl
    libnotify
  ];
}

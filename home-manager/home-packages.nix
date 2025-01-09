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
 rustc
    cargo
    # WM stuff
    playerctl
    libnotify
    pavucontrol
  ];
}

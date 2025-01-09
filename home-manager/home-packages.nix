{pkgs, ...}: {
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

    # WM stuff
    playerctl
    libnotify
    pavucontrol
  ];
}

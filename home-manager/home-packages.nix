{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fzf
    ripgrep
    unzip
    zip
    vscode
    brave
    dolphin
    btop
    wl-clipboard

    # WM stuff
    playerctl
    libnotify
    pavucontrol
    pulseaudio
  ];
}

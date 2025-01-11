{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ripgrep
    unzip
    zip
    vscode
    brave
    dolphin
    btop
    wl-clipboard
    neofetch
    playerctl
    libnotify
    pavucontrol
    pulseaudio
    networkmanagerapplet
  ];
}

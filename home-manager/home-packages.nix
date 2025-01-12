{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ripgrep
    unzip
    nautilus
    zip
    vscode
    brave
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

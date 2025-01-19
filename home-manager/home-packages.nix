{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ripgrep
    unzip
    nautilus
    zip
    btop
    code-cursor
    wl-clipboard
    neofetch
    playerctl
    libnotify
    pavucontrol
    brightnessctl
    pulseaudio
    networkmanagerapplet
  ];
}

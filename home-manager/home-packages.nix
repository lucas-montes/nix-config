{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    dconf
    openssl
    ripgrep
    xournalpp
    stripe-cli
    unzip
    nautilus
    zip
    rpi-imager
    sqlitestudio
    wl-clipboard
    grimblast
    neofetch
    playerctl
    libnotify
    pavucontrol
    brightnessctl
    pulseaudio
    networkmanagerapplet
  ];
}

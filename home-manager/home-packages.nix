{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    usbutils
    dconf
    openssl
    ripgrep
    xournalpp
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

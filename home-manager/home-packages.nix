{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    nomacs
    xournalpp
    nautilus

    rpi-imager
    sqlitestudio

    usbutils
    openssl
    ripgrep

    unzip
    zip

    wl-clipboard
    grimblast
    playerctl
    libnotify
    pavucontrol
    brightnessctl
    pulseaudio
    networkmanagerapplet
  ];
}

{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    nomacs
    xournalpp
    nautilus
    nemo
    pcmanfm

    rpi-imager
    sqlitestudio

    usbutils
    dconf
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

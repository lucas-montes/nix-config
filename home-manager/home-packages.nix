{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    nomacs
    xournalpp
    nautilus
    nemo
    dolphin
    pcmanfm

    rpi-imager
    sqlitestudio

    usbutils
    dconf
    openssl
    ripgrep
    dstat
    unzip
    zip

    neofetch

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

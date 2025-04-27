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

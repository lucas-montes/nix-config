{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.audacity
    pkgs.nomacs
    pkgs.xournalpp
    pkgs.nautilus

    pkgs.rpi-imager
    pkgs.sqlitestudio

    pkgs.usbutils
    pkgs.openssl
    pkgs.ripgrep

    pkgs.unzip
    pkgs.zip

    pkgs.wl-clipboard
    pkgs.grimblast
    pkgs.playerctl
    pkgs.libnotify
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.pulseaudio
    pkgs.networkmanagerapplet
  ];
}

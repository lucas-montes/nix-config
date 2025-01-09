{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # CLI utils
    fzf
    ripgrep
    unzip
    zip
    kitty
    vscode

    # Coding stuff
    nodejs
    python312

    # WM stuff
    # libsForQt5.xwaylandvideobridge
    libnotify
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland

  ];
}

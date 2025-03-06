{
  user,
  pkgs,
  ...
}: {
  # GTK theme configuration
  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };
    font = {
      name = "Roboto";
      size = 11;
    };
    gtk3 = {
      bookmarks = [
        "file:///home/${user}/Documents"
        "file:///home/${user}/Downloads"
        "file:///home/${user}/Pictures"
        "file:///home/${user}/Videos"
        "file:///home/${user}/Downloads/temp"
        "file:///home/${user}/Documents/repositories"
      ];
    };
  };
}

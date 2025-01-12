{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      gtk-tabs-location = "hidden";
      gtk-single-instance = true;
      window-decoration = false;
      auto-update = "off";
      confirm-close-surface = false;
    };
  };
}

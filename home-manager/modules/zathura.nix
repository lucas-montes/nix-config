{
  programs.zathura = {
    enable = true;
    options = {
      "recolor-lightcolor" = "rgba(0, 0, 0, 0)";
      "recolor-darkcolor" = "rgba(255, 255, 255, 1)";
      "recolor" = "true";
      "adjust-open" = "best";
      "guioptions" = "none";
    };
    mappings = {
      "i" = "recolor"; # toggle recoloring
      "j" = "feedkeys <C-Down>"; # scroll down
      "k" = "feedkeys <C-Up>"; # scroll up
    };
  };
}

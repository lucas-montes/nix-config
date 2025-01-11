{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "JetBrains Mono";
        color = "rgba(235, 219, 178, 1.0)";
        position = "0, 600";
        halign = "center";
        walign = "center";

        shadow_passes = 1;
      };

    };
  };
}

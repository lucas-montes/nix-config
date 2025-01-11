{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 14;
        margin-top = 2;
        margin-bottom = 0;
modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["tray" "hyprland/language" "pulseaudio" "network"];


    "hyprland/language" = {
        format= "  {1}";
        tooltip= false;
    };

        "clock" = {
          format = "  {:%A - %B %d, %Y - %R}";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        "pulseaudio" = {
          tooltip = false;
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          on-click = "pavucontrol";
        };

        "tray" = {
          icon-size = 16;
          spacing = 5;
        };
      };
    };
  };
}

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
        modules-left = [
        ];

        modules-center = ["hyprland/workspaces"];
        modules-right = ["tray" "network" "pulseaudio" "clock"];

        "clock" = {
          format = "<span foreground='#6D8895' font='14.5' rise='-1000'> </span>{:%H:%M}";
          format-alt = "<span foreground='#6D8895' font='14.5' rise='-1000'> </span>{:%A %B de %Y}";
        };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          disable-scroll = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "magic" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
            sort-by-number = true;
          };
        };

        "pulseaudio" = {
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

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };

        "network" = {
          format-ethernet = "<span foreground='#7aa2f7' font='14.5' rise='-1000'> </span>{ipaddr}";
          format-linked = "<span foreground='#7aa2f7' font='14.5' rise='-1000'> </span>{ifname} (No IP)";
        };

        "tray" = {
          icon-size = 16;
          spacing = 5;
        };
      };
    };
  };
}

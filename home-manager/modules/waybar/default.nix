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
        modules-right = ["bluetooth" "hyprland/language" "pulseaudio"];

        "hyprland/language" = {
          format = "  {1}";
          tooltip = false;
        };

#         "sway/language": {
#     "format": "{}",
#     "on-click": "swaymsg input type:keyboard xkb_switch_layout next",
# },https://github.com/Alexays/Waybar/wiki/Module:-Language

# "sway/language": {
#     "format": "{short} {variant}",
# }



        "clock" = {
          format = "  {:%A - %B %d, %Y - %R}";
          tooltip = true;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          on-click-right = "mode";
          format = {
          months = "<span color='#ffead3'><b>{}</b></span>";
          days = "<span color='#ecc6d9'><b>{}</b></span>";
          weeks = "<span color='#99ffdd'><b>W{}</b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          today = "<span color='#ff6699'><b><u>{}</u></b></span>";
        };
          };
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

        "bluetooth" = {
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          tooltip = true;
          format = " {status}";
        };
      };
    };
  };
}

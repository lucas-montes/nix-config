{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  wayland.windowManager.hyprland = {
    
    enable = true;
    systemd.enable = true;
    settings = {
      monitor = ",preferred,auto,auto";
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi";
      "$browser" = "brave";

      exec-once = [
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      general = {
        gaps_in = 5;
        gaps_out = "5,5,5,5";
        border_size = 2;
        "col.active_border" = "rgb(CBA6F7) rgb(D2F7A6) 45deg";
        "col.inactive_border" = "rgb(5cf9eb) rgb(5ecae9) 45deg";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "0x66000000";
        };

        blur = {
          enabled = false;
          size = 12;
          passes = 3;
          new_optimizations = true;
          noise = 0.05;
          ignore_opacity = true;
        };
      };

      animations = {
        enabled = true;
      };

      input = {
        kb_layout = "us,latam";
        kb_options = "grp:alt_shift_toggle";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}

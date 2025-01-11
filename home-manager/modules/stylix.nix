{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  home.packages = with pkgs; [
    jetbrains-mono
    font-awesome
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = {
    base00 = "000000"; #background default: 282936
    base01 = "333547";
    base02 = "4d4f68";
    base03 = "626483";
    base04 = "62d6e8";
    base05 = "e9e9f4"; #foreground
    base06 = "f1f2f8";
    base07 = "f7f7fb";
    base08 = "ea51b2";
    base09 = "b45bcf";
    base0A = "00f769";
    base0B = "ebff87";
    base0C = "a1efe4";
    base0D = "62d6e8";
    base0E = "b45bcf";
    base0F = "00f769";
  };

    targets = {
      kitty.enable = true;
      neovim.enable = true;
      vscode.enable = true;
      lazygit.enable = true;
      hyprlock.enable = true;
      swaync.enable = true;
      tmux.enable = true;
      fzf.enable = true;
      btop.enable = true;
      rofi.enable = true;
      gtk.enable = true;
      hyprland.enable = false;
      waybar.enable = false;
    };


    image = ../../wallpaper.jpg;
  };
}

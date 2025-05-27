{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.stylix.homeModules.stylix];

  home.packages = [
    pkgs.jetbrains-mono
    pkgs.font-awesome
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = {
      base00 = "000000"; #background default: 282936
      base01 = "333547";
      base02 = "44475a";
      base03 = "6272a4";
      base04 = "62d6e8";
      base05 = "f8f8f2"; #foreground
      base06 = "f1f2f8";
      base07 = "f3f981";
      base08 = "e176ba";
      base09 = "8be9fd";
      base0A = "51d6f4";
      base0B = "6450fa";
      base0C = "ebff87";
      base0D = "b45bcf";
      base0E = "00f769";
      base0F = "ff5555";
    };

    targets = {
      tmux.enable = false;
      hyprland.enable = false;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.font-awesome;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
    };

    image = ../../wallpaper.png;
  };
}

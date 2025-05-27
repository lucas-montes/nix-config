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
      base07 = "f7f7fb";
      base08 = "ff5555";
      base09 = "ffb86c";
      base0A = "ebff87";
      base0B = "50fa7b";
      base0C = "8be9fd";
      base0D = "b45bcf";
      base0E = "ea51b2";
      base0F = "00f769";
    };

    targets = {
      nvf.enable = false;
      starship.enable = true;
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

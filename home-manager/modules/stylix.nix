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
      base01 = "333547"; #background secondary: 3a3c4e
      base02 = "44475a"; #background tertiary: 44475a
      base03 = "6272a4";
      base04 = "62d6e8"; #light foreground: 62d6e8
      base05 = "f8f8f2"; #foreground
      base06 = "f1f2f8"; #light background
      base07 = "f3f981"; #yellow og: f7f7f7b
      base08 = "ea51b2"; #pinker
      base09 = "b45bcf"; #purple
      base0A = "3ff0a9"; #green-blue og: 00f769
      base0B = "ebff87"; #yellow
      base0C = "a1efe4"; #cyan
      base0D = "51d6f4"; #blue og: 62d6e8
      base0E = "ff55a1"; #pink og: b45bcf
      base0F = "00f769"; #green
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

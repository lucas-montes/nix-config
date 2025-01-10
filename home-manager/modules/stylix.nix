{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  home.packages = with pkgs; [
    dejavu_fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

    targets = {
      kitty.enable = true;
      neovim.enable = true;
      waybar.enable = false;
      btop.enable = true;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = ../../nix-wallpaper-dracula.png;
  };
}

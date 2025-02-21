{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono Nerd Fonts"];})
      jetbrains-mono
      font-awesome
    ];

    enableDefaultPackages = false;
    fontconfig.useEmbeddedBitmaps = true;
  };
}

{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      twemoji-color-font
      fira-code
      fira-code-symbols
      font-awesome
    ];
  };

}

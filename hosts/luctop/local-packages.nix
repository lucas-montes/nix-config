{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
gzip
brave
curl
fzf
ripgrep
wget
git
jq

#Hyprland
# hyprpaper
# dunst
# kitty
# networkmanagerapplet
#  waybar 
#  dolphin
#  rofi-wayland
  ];
}

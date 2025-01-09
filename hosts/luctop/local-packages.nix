{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
curl
wget
git
    vscode
    brave

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

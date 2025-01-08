{ pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

    # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latin,us";
    variant = "";
  };

#TODO: use only the necessary ones
fonts.packages = with pkgs; [ nerdfonts ];

  # Allow unfree packages
nixpkgs.config.allowUnfree = true;
programs.hyprland.enable = true;
environment.variables.NIXOS_OZONE_WL = "1";
programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
};
programs.seahorse.enable = true;
services.gnome.gnome-keyring = { enable = true; };
virtualisation.docker.enable = true;
# Files, browser, screen sharing stuff
xdg.portal = {
enable = true;
extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};

  system.stateVersion = stateVersion;
}

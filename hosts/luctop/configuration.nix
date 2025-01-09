{ pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

# TODO: maybe move this to the user home-manager
    # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latin,us";
    variant = "";
  };

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

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
          inputs.home-manager.nixosModules.home-manager
    ];

 home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      lucas = import ../home-manager/home.nix;
    };
  };

services.udisks2.enable = true;


    fileSystems."/data" =
    { device = "/dev/disk/by-label/SSD-1TB";
      fsType = "vfat";
        options = [ "defaults" "user" "rw" "utf8" "umask=000" ];

    };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "luctop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
 # networking.proxy.default = "192.168.1.16";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.insertNameservers = [ "192.168.1.16" ];

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latin,us";
    variant = "";
  };

#TODO: use only the necessary ones
fonts.packages = with pkgs; [ nerdfonts ];


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


hardware.graphics.enable = true;
services.xserver.videoDrivers = ["nvidia"];
hardware.nvidia-container-toolkit.enable = true;
hardware.nvidia = {
modesetting.enable = true;
powerManagement.enable = false;
powerManagement.finegrained = false;
open = false;
nvidiaSettings = true;
package = config.boot.kernelPackages.nvidiaPackages.stable;
prime = {
intelBusId = "PCI:0:2:0";
nvidiaBusId = "PCI:1:0:0";
sync.enable = true;
};
};

programs.hyprland.enable = true;
environment.variables.NIXOS_OZONE_WL = "1";

  nix.gc.automatic = true;
	  nix.gc.dates = "03:15";
nix.settings = {
      # Enable flakes and new 'nix' command
      experimental-features = [ "nix-command" "flakes" ];
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  home-manager
gzip
brave
curl
fzf
ripgrep
wget
git
jq

#Hyprland
hyprpaper
dunst
kitty
networkmanagerapplet
 waybar 
 dolphin
 rofi-wayland
];


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucas = {
    isNormalUser = true;
    description = "lucas";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };


# Files, browser, screen sharing stuff
xdg.portal = {
enable = true;
extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
} 

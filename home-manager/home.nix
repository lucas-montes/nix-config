{
  homeStateVersion,
  user,
  ...
}: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
  };

   services.xserver.enable = true; # Enable the X11 windowing system.

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
   services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
      # theme = "astronaut";
      settings.Theme.CursorTheme = "Bibata-Modern-Classic";
    };
  };
}

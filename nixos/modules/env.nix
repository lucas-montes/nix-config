{
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL = "1";
    TERMINAL = "ghostty";
    EDITOR = "nvim";
    XDG_BIN_HOME = "$HOME/.local/bin";
     XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
}

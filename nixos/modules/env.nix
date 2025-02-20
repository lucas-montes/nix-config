{
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL = "1";
    TERMINAL = "ghostty";
    EDITOR = "nvim";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
}

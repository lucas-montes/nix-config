{
  programs.git = {
    enable = true;
    userName = "Lucas";
    userEmail = "lluc23@hotmail.com";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      fetch = {
        prune = true;
      };
      pull = {
        rebase = true;
      };
    };
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations";
        whitespace-error-style = "22 reverse";
      };
    };
  };
}

{
  pkgs,
  user,
  ...
}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      description = "lucas";
      extraGroups = ["networkmanager" "wheel" "docker" "dialout" "disk"];
    };
  };

  services.getty.autologinUser = user;
}

{
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = "$python$directory$character";
        right_format = "$status$git_branch$git_status";
        shell = {
          disabled = false;
          format = "$indicator";
          bash_indicator = "[BASH](bright-white) ";
          zsh_indicator = "[ZSH](bright-white) ";
        };
        status = {
          disabled = false;
          symbol = "✘ ";
        };
        nix_shell = {
          symbol = "";
          format = "[$symbol$name]($style) ";
        };
        git_branch = {
          format = "[$branch]($style) ";
        };

        directory = {
          read_only = " ";
          truncation_length = 0;
        };
        cmd_duration = {
          format = "[$duration]($style) ";
        };
        character = {
          success_symbol = "[❯](red)[❯](yellow)[❯](green)";
          error_symbol = "[❯](red)[❯](yellow)[❯](green)";
          vicmd_symbol = "[❮](green)[❮](yellow)[❮](red)";
        };
      };
    };
  };
}

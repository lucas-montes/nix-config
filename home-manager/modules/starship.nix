{lib, ...}:
let 
createComponent = color: value: "[─](fg:current_line)[](fg:${color})[$symbol ](fg:primary bg:${color})[](fg:${color} bg:box)[ ${value}](fg:foreground bg:box)[](fg:box)";
in{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        palette = "dracula";
        palettes.dracula = {
          foreground = "#F8F8F2";
          background = "#282A36";
          current_line = "#44475A";
          primary = "#1E1F29";
          box = "#44475A";
          blue = "#6272A4";
          cyan = "#8BE9FD";
          green = "#50FA7B";
          orange = "#FFB86C";
          pink = "#FF79C6";
          purple = "#BD93F9";
          red = "#FF5555";
          yellow = "#F1FA8C";
        };
        add_newline = true;

        format = lib.strings.concatStrings [
          "[╭](fg:current_line)"
          "$username"
          "$directory"
          "$cmd_duration"

          "$git_branch"
          "$nix_shell"
          "$rust"
          "$python"
          "$package"

          "$line_break"
          "$character"
        ];

        username = {
          symbol = "";
          show_always = true;
          disabled = false;
format =  (createComponent "green" "$user");        };

        directory = {
          symbol = "󰷏";
          format =  (createComponent "pink" "$read_only$truncation_symbol$path");
          home_symbol = " ~/";
          truncation_symbol = " ";
          truncation_length = 2;
          read_only = "󱧵 ";
          read_only_style = "";
          #           substitutions = {
          #             Documents = "󰈙";
          # Downloads = "";
          # Music = "󰝚";
          # Pictures = "";
          # Repos = "󰲋";
          #           };
        };

        git_branch = {
          format =  (createComponent "purple" "$branch");
          symbol = "";
        };

        nix_shell = {
          symbol = "";
          format =  (createComponent "cyan" "$version");
        };

        rust = {
          format =  (createComponent "pink" "$version");
          version_format = "v$raw";
          symbol = "🦀 ";
          style = "bold red bg:0x86BBD8";
          disabled = false;
          detect_extensions = ["rs"];
          detect_files = ["Cargo.toml"];
          detect_folders = [];
        };
        python = {
          format =  (createComponent "blue" "$pyenv_prefix($version )(($virtualenv) )");
          python_binary = [
            "python"
            "python3"
            "python2"
          ];
          pyenv_prefix = "pyenv ";
          pyenv_version_name = true;
          symbol = "🐍";
          version_format = "v$raw";
          disabled = false;
          detect_extensions = ["py"];
          detect_files = [
            "requirements.txt"
            ".python-version"
            "pyproject.toml"
            "Pipfile"
            "tox.ini"
            "setup.py"
            "__init__.py"
          ];
          detect_folders = [];
        };

        package = {
          format =  (createComponent "red" "$version");
          symbol = "📦";
          display_private = false;
          disabled = false;
          version_format = "v$raw";
        };


        cmd_duration = {
          symbol = "";
          min_time = 500;
          show_milliseconds = true;
          format =  (createComponent "orange" "$duration");
        };

        character = {
          format = "[╰─$symbol](fg:current_line) ";
          success_symbol = "[λ](fg:bold white)";
          error_symbol = "[×](fg:bold red)";
        };
      };
    };
  };
}

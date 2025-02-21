{lib, ...}: let
  createAllComponent = color: symbol: value: "[─](fg:current_line)[](fg:${color})[${symbol} ](fg:primary bg:${color})[](fg:${color} bg:box)[ ${value}](fg:foreground bg:box)[](fg:box)";
  createComponent = color: value: createAllComponent color "$symbol" value;
in {
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        #TODO: reuse from stylix
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

          "$git_branch"
          "$nix_shell"
          "$rust"
          "$python"
          "$package"
          "$cmd_duration"

          "$line_break"
          "$character"
        ];

        fill = {
          symbol = "─";
          style = "fg:current_line";
        };

        username = {
          show_always = true;
          disabled = false;
          format = createAllComponent "purple" "" "$user";
        };

        directory = {
          disabled = false;
          format = createAllComponent "pink" "" "$path";
          home_symbol = "~";
          truncate_to_repo = false;
          truncation_length = 0;
        };

        git_branch = {
          format = createComponent "red" "$branch";
          symbol = "";
        };

        nix_shell = {
          symbol = "";
          format = createComponent "cyan" "$state( ($name))";
        };

        rust = {
          format = createComponent "orange" "$version";
          version_format = "v$raw";
          symbol = "🦀";
          style = "bold red bg:0x86BBD8";
          disabled = false;
          detect_extensions = ["rs"];
          detect_files = ["Cargo.toml"];
          detect_folders = [];
        };
        python = {
          format = createComponent "blue" "$pyenv_prefix($version )(($virtualenv) )";
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
          format = createComponent "green" "$version";
          symbol = "📦";
          display_private = false;
          disabled = false;
          version_format = "v$raw";
        };

        cmd_duration = {
          min_time = 500;
          show_milliseconds = true;
          format = createAllComponent "yellow" "" "$duration";
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

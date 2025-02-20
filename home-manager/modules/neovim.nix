{
  config,
  inputs,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  imports = [inputs.nvf.homeManagerModules.nvf];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        notes.todo-comments.enable = true;
        assistant.copilot = {
          enable = true;
          cmp.enable = true;
        };
        options = {
          wrap = false;

          # Disable backup, swap, and writebackup files
          backup = false;
          writebackup = false;
          swapfile = false;

          # Alternatively, store swap and backup files in /tmp
          directory = "/tmp"; # For swap files
          backupdir = "/tmp"; # For backup files
        };
        undoFile = {
          enable = true;
          path = "/tmp";
        };
        binds = {
          whichKey.enable = true;
        };
        keymaps = [
          {
            key = "<leader>y";
            mode = ["n" "v"];
            silent = true;
            action = "\"+y";
          }
          {
            key = "<leader>pv";
            mode = "n";
            silent = true;
            action = ":Ex<CR>";
          }
        ];
        lsp = {
          enable = true;
          trouble.enable = true;
        };
        viAlias = true;
        vimAlias = true;
        statusline.lualine = {
          enable = true;
          theme = "base16";
        };
        theme = {
          name = "base16";
          style = "dark";
          base16-colors = {
            inherit (colors) base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
          };
          enable = true;
        };
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          rust.enable = true;
          html.enable = true;
          css.enable = true;
          ts.enable = true;
          python.enable = true;
        };
      };
    };
  };
}

{config, ...}: let
  inherit (config.lib.stylix) colors;
in {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        undoFile.enable = true;
        binds = {
          whichKey.enable = true;
        };
        keymaps = [
          {
            key = "<leader>y";
            mode = ["n" "v"];
            silent = true;
            action = "[[+y]]";
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
          base16-colors = colors;
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
          python.enable = true;
        };
      };
    };
  };
}

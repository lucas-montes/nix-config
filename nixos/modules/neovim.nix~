{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        undoFile.enable = true;
        binds = {
          whichKey.enable = true;
        };
        statusline.lualine.enable = true;
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
        theme = {
          enable = true;
          name = "dracula";
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

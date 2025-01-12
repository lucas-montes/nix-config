{config, pkgs, inputs, ...}: let
  inherit (config.lib.stylix) colors;
in {
  imports = [inputs.nvf.homeManagerModules.nvf];
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
          base16-colors = {
            base00= colors.base00;
base01 = colors.base01;
base02 = colors.base02;
base03 = colors.base03;
base04 = colors.base04;
base05 = colors.base05;
base06 = colors.base06;
base07 = colors.base07;
base08 = colors.base08;
base09 = colors.base09;
base0A = colors.base0A;
base0B = colors.base0B;
base0C = colors.base0C;
base0D = colors.base0D;
base0E = colors.base0E;
base0F = colors.base0F;
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
          python.enable = true;
        };
      };
    };
  };
}

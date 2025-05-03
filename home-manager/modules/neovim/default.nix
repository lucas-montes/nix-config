{
  config,
  inputs,
  pkgs,
  user,
  ...
}: let
  inherit (config.lib.stylix) colors;
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: toLua (builtins.readFile "${./config}/${file}.lua");
  fromPlugin = file: toLuaFile "plugins/${file}";
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
            alejandra
      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      undotree
      which-key-nvim
      {
        plugin = nvim-lspconfig;
               config = fromPlugin "lsp";
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      neodev-nvim

      nvim-cmp
      {
        plugin = nvim-cmp;
        #config = toLuaFile ./nvim/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = fromPlugin "telescope";
      }

      telescope-fzf-native-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      lualine-nvim
      nvim-web-devicons

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
           p.tree-sitter-rust
        ]);
       config = fromPlugin "treesitter";
      }

      vim-nix

    ];

    extraLuaConfig = ''
      ${builtins.readFile ./config/options.lua}
    '';

  };
}

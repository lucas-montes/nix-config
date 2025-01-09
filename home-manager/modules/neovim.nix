{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      python312Packages.python-lsp-server
      nixd
      vimPlugins.nvim-treesitter-parsers.hyprlang
    ];
  };
}

{ lib, stdenv, neovim-unwrapped, wrapNeovim, vimPlugins
, lazyvim, customRC ? null }:

let
  baseConfig = {
    customRC = ''
      vim.opt.rtp:prepend("${lazyvim}")
      require("lazy").setup("plugins")
      ${lib.optionalString (customRC != null) customRC}
    '';

    packages.myVimPackage = {
      start = with vimPlugins; [
        # LazyVim core
        lazy-nvim
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp
        lsp-zero-nvim
        nvim-treesitter.withAllGrammars
        telescope-nvim
        which-key-nvim
        plenary-nvim
        
        # Optional extras
        neo-tree-nvim
        nvim-web-devicons
      ];
    };
  };

in wrapNeovim neovim-unwrapped (baseConfig // {
  viAlias = true;
  vimAlias = true;
})

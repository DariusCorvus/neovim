{
  description = "Neovim configuration using LazyVim starter template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Or your preferred channel
    lazyvim-starter = {
      url = "github:LazyVim/starter";
      flake = false; # Starter template is *not* a flake. Crucial.
    };
  };

  outputs = { self, nixpkgs, lazyvim-starter }:
    let
      system = "x86_64-linux"; # Replace with your system if needed
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true; # If you need unfree packages
      };
    in
    {
      # For use with 'nix run' or as an input to another flake.
      packages.${system}.neovim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        configure = {
          packages.myNeovimConfig = {
            name = "my-neovim-config"; # Arbitrary name.
            start = [ ];
            opt = [ ];  # Avoid listing plugins here. Lazy handles this.
          };
          customRC = ''
            lua << EOF
              -- Set up LazyVim.  This is where we pull in the LazyVim starter.
              require("lazy").setup({
                spec = {
                  { import = "plugins" },  -- Standard LazyVim structure.
                },
                defaults = { lazy = true },
                install = { colorscheme = { "habamax" } },  -- Example config
                checker = { enabled = true },
                performance = {
                  rtp = {
                    disabled_plugins = {
                      "gzip",
                      "matchit",
                      "matchparen",
                      "netrwPlugin",
                      "tarPlugin",
                      "tohtml",
                      "tutor",
                      "zipPlugin",
                    },
                  },
                },
              })

              -- Add your overrides, options, etc.  as needed.
              vim.opt.relativenumber = true
              vim.g.mapleader = " "
            EOF
          '';
        };
      };


      # For `nixos-rebuild` (legacy) or nix-env
      legacyPackages.${system} = {
        my-neovim-config = self.packages.${system}.neovim;
      };
    };
}

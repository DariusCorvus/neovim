{
  description = "lazyvim neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    let
      pkgs = nixpkgs.legacyPackages.${system};
      lazyvim-starter-repo = pkgs.fetchFromGitHub {
        owner = "LazyVim";
        repo = "starter";
        rev = "latest";
        sha256 = "";
      };
    in {
      defaultApp = {
        type = "app";
        program = "${pkgs.neovim}/bin/nvim";
      };
      packages.default = pkgs.stdenv.mkDerivation {
        name = "lazyvim";
        src = lazyvim-starter-repo;
        buildPhase = ''
          mkdir -p $out/share/nvim/site/pack/lazy/start
          cp -r ./* $out/share/nvim/site/pack/lazy/start/
        '';
      };
    };
  };
}

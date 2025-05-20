self: super: {
  typescript-svelte-plugin = import ../nix/node-packages/typescript-svelte-plugin-composition.nix {
    inherit (super) pkgs system;
    nodejs = super.nodejs_24;
  };
}

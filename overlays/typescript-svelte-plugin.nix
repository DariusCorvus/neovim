self: super: {
  typescript-svelte-plugin = super.buildNpmPackage {
    pname = "typescript-svelte-plugin";
    version = "0.3.47";

    src = super.fetchurl {
      url = "https://registry.npmjs.org/typescript-svelte-plugin/-/typescript-svelte-plugin-0.3.47.tgz";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    npmDepsHash = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=";

    dontNpmBuild = true;

    installPhase = ''
      mkdir -p $out/lib/node_modules/typescript-svelte-plugin
      cp -r . $out/lib/node_modules/typescript-svelte-plugin
    '';
  };
}

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        vtsls = {
          autoUseWorkspaceTsdk = true,
          enableMoveToFileCodeAction = true,
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
            },
            maxInlayHintLength = 30,
          },
          tsserver = {
            globalPlugins = {
              {
                enableForWorkspaceTypeScriptVersions = true,
                location = vim.env.TS_SVELTE_PLUGIN_PATH or '/dev/null',
                name = 'typescript-svelte-plugin',
              },
            },
          },
        },
      },
    },
  },
}

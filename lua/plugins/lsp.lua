return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        svelte = {},
        qmlls = {
          cmd = { 'qmlls' },
          filetypes = { 'qml', 'qmljs' },
          root_dir = require('lspconfig.util').root_pattern('.qmlproject', '.git'),
        },
        vtsls = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    enableForWorkspaceTypeScriptVersions = false,
                    location = vim.env.TS_SVELTE_PLUGIN_PATH or '/dev/null',
                    name = 'typescript-svelte-plugin',
                  },
                },
              },
            },
          },
        },
      },
    },
  },
}

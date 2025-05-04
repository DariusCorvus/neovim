return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        qmlls = {
          cmd = { 'qmlls' },
          filetypes = { 'qml', 'qmljs' },
          root_dir = require('lspconfig.util').root_pattern('.qmlproject', '.git'),
        },
      },
    },
  },
}

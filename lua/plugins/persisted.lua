return {
  {
    'folke/persistence.nvim',
    enabled = false,
  },
  {
    'folke/snacks.nvim',
    opts = {
      dashboard = {
        enabled = false,
      },
    },
  },
  {
    'olimorris/persisted.nvim',
    event = 'BufReadPre',
    lazy = false,
    opts = {
      use_git_branch = true,
      autoload = true,
    },
    keys = {
      {
        '<leader>qs',
        function()
          require('persisted').save()
        end,
        desc = 'Save Session',
      },
      {
        '<leader>qf',
        function()
          require('persisted').select()
        end,
        desc = 'Select Session',
      },
      {
        '<leader>ql',
        function()
          require('persisted').load()
        end,
        desc = 'Load Session',
      },
      {
        '<leader>qd',
        function()
          require('persisted').delete()
        end,
        desc = 'Delete Session',
      },
    },
  },
}

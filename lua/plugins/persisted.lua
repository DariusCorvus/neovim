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
    opts = {
      follow_cwd = true,
      use_git_branch = true,
      autoload = true,
    },
  },
}

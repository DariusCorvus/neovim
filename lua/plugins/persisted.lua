return {
  {
    'folke/persistence.nvim',
    enabled = false,
  },
  {
    'olimorris/persisted.nvim',
    event = 'BufReadPre',
    opts = {
      use_git_branch = true,
      autoload = true,
    },
  },
}

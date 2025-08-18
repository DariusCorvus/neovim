return {
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = function(_, opts)
      local sql_ft = { 'sql' }
      opts.formatters.sqlfluff = {
        args = { 'format', '-n', '-' },
      }
      for _, ft in ipairs(sql_ft) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], 'sqlfluff')
      end
    end,
  },
}

local function find_sqlfluff_config(filename)
  return vim.fs.find('.sqlfluff', { upward = true, path = filename })[1]
end

return {
  {
    'mfussenegger/nvim-lint',
    optional = true,
    opts = function(_, opts)
      local lint = require 'lint'

      -- Define/override the sqlfluff linter
      lint.linters.sqlfluff.args = { 'lint', '--format=json' }
      local sql_ft = { 'sql' }
      for _, ft in ipairs(sql_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], 'sqlfluff')
      end
    end,
  },
}

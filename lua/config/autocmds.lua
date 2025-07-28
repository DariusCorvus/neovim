vim.opt.rtp:append(vim.fn.expand '~/.config/nvim')
local function augroup(name)
  return vim.api.nvim_create_augroup('darius.codes:' .. name, { clear = true })
end
local persisted = require 'persisted'
vim.api.nvim_create_autocmd('VimEnter', {
  group = augroup 'persisted',
  nested = true,
  callback = function()
    if vim.g.started_with_stdin then
      return
    end

    local forceload = false
    if vim.fn.argc() == 0 then
      forceload = true
    elseif vim.fn.argc() == 1 then
      local dir = vim.fn.expand(vim.fn.argv(0))
      if dir == '.' then
        dir = vim.fn.getcwd()
      end

      if vim.fn.isdirectory(dir) ~= 0 then
        forceload = true
      end
    end

    persisted.autoload { force = forceload }
  end,
})

local opt = vim.opt

opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
opt.ruler = true
opt.scrolloff = 8
opt.sidescrolloff = 16
opt.rtp:append(vim.fn.expand '~/.config/nvim')

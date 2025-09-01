local opt = vim.opt

opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
opt.ruler = true
opt.rtp:append(vim.fn.expand '~/.config/nvim')

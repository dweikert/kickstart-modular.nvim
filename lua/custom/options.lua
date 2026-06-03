vim.opt.relativenumber = true
vim.opt.colorcolumn = '88'
vim.opt.bg = 'dark'
vim.opt.termguicolors = true

-- OSC52 clipboard for tmux/SSH environments
vim.g.clipboard = nil
vim.opt.clipboard = {}
vim.g.osc52_timeout = 0
local function paste() return { vim.fn.split(vim.fn.getreg '', '\n'), vim.fn.getregtype '' } end
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy '+',
    ['*'] = require('vim.ui.clipboard.osc52').copy '*',
  },
  paste = {
    ['+'] = paste,
    ['*'] = paste,
  },
}

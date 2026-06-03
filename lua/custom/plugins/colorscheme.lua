---@module 'lazy'
---@type LazySpec
return {
  { 'folke/tokyonight.nvim', enabled = false },
  {
    'yassinebridi/vim-purpura',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'purpura'
    end,
  },
}

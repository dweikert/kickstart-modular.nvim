return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Trouble: buffer diagnostics' },
    { '<leader>xX', '<cmd>Trouble diagnostics toggle<cr>',              desc = 'Trouble: workspace diagnostics' },
    { '<leader>xq', '<cmd>Trouble qflist toggle<cr>',                   desc = 'Trouble: quickfix' },
  },
}

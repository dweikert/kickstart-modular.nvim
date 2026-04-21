return {
  'stevearc/aerial.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    layout = { default_direction = 'right' },
    attach_mode = 'global',
  },
  keys = {
    { '<leader>o', '<cmd>AerialToggle<cr>', desc = 'Aerial: toggle symbol outline' },
    { '[[',        '<cmd>AerialPrev<cr>',   desc = 'Aerial: prev symbol' },
    { ']]',        '<cmd>AerialNext<cr>',   desc = 'Aerial: next symbol' },
  },
}

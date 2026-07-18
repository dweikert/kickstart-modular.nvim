-- Project-wide search and replace in a normal buffer: type the search and
-- replacement, see matches live, edit the result list freely, then apply.
-- Fills the one real gap left by telescope live_grep, which is read-only.
--
-- LazyVim replaced nvim-spectre with this. Needs ripgrep, already present via
-- telescope-fzf-native.
--
-- Keys: <leader>F is a *prefix*, never a direct mapping. <leader>sr / <leader>sR are
-- taken (telescope resume, search-repos), and a direct <leader>F alongside <leader>Fw
-- would make the bare key wait 'timeoutlen' -- the same ambiguity that <leader>p and
-- the old <leader>pv had. Visual-mode <leader>F is direct because nothing else
-- occupies <leader>F* in visual mode.

---@module 'lazy'
---@type LazySpec
return {
  'MagicDuck/grug-far.nvim',
  cmd = { 'GrugFar', 'GrugFarWithin' },
  opts = { headerMaxWidth = 80 },
  keys = {
    {
      '<leader>Ff',
      function() require('grug-far').open() end,
      mode = 'n',
      desc = 'grug-far: find/replace across project',
    },
    {
      '<leader>Fw',
      function() require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } } end,
      mode = 'n',
      desc = 'grug-far: replace word under cursor',
    },
    {
      '<leader>Fb',
      function() require('grug-far').open { prefills = { paths = vim.fn.expand '%' } } end,
      mode = 'n',
      desc = 'grug-far: find/replace in current buffer',
    },
    {
      '<leader>F',
      function() require('grug-far').with_visual_selection() end,
      mode = 'x',
      desc = 'grug-far: find/replace selection',
    },
  },
}

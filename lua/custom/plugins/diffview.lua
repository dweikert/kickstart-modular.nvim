-- Whole-commit / whole-range diff review with a file panel, plus a proper 3-way
-- merge-conflict view. Complements fugitive rather than replacing it: fugitive's
-- :Gdiffsplit is per-file, this reviews a range.
--
-- <leader>d* is free; <leader>g holds only <leader>gs (neo-tree git status).

---@module 'lazy'
---@type LazySpec
return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles' },
  opts = {},
  keys = {
    { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Diffview: open (working tree)' },
    { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Diffview: close' },
    { '<leader>dh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview: history of this file' },
    { '<leader>dH', '<cmd>DiffviewFileHistory<cr>', desc = 'Diffview: history of this branch' },
    { '<leader>dm', '<cmd>DiffviewOpen<cr>', desc = 'Diffview: resolve merge conflicts' },
  },
}

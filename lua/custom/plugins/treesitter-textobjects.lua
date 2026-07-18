-- Semantic textobjects: select/move/swap by function, class and parameter.
-- mini.ai already covers brackets, quotes and args; this adds the syntax-aware ones.
--
-- MAIN BRANCH API. The old `require('nvim-treesitter.configs').setup{ textobjects = ... }`
-- form is gone -- nvim-treesitter is on `branch = 'main'` here (see
-- lua/kickstart/plugins/treesitter.lua), so keymaps go through plain vim.keymap.set
-- against the select/move/swap modules.
--
-- Two key choices forced by this config:
--   * class motions use ]C/[C, not the upstream-idiomatic ]]/[[ (aerial owns those,
--     custom/plugins/aerial.lua) and not ]c/[c (vim builtin: next/prev diff hunk --
--     mapping those would break navigation in every :diffsplit, fugitive diff and
--     `nvim -d`, which now matters more with diffview installed).
--   * repeat-move is on ; and <M-;>. Upstream maps `,` to repeat-backwards, but `,`
--     is maplocalleader here (init.lua) -- a complete mapping that is also a prefix
--     makes every <localleader> sequence stall for 'timeoutlen'.

---@module 'lazy'
---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = { lookahead = true },
      move = { set_jumps = true },
    }

    local select = require 'nvim-treesitter-textobjects.select'
    local move = require 'nvim-treesitter-textobjects.move'
    local swap = require 'nvim-treesitter-textobjects.swap'
    local rm = require 'nvim-treesitter-textobjects.repeatable_move'

    -- Select: vaf/vif (function), vac/vic (class), vaa/via (parameter).
    -- `if` needs bracket-quoting -- it's a Lua keyword.
    local objects = {
      af = '@function.outer',
      ['if'] = '@function.inner',
      ac = '@class.outer',
      ic = '@class.inner',
      aa = '@parameter.outer',
      ia = '@parameter.inner',
    }
    for lhs, capture in pairs(objects) do
      vim.keymap.set({ 'x', 'o' }, lhs, function() select.select_textobject(capture, 'textobjects') end, { desc = 'Select ' .. capture })
    end

    -- Move. move.goto_* are internally wrapped in make_repeatable_move, so ; / <M-;>
    -- repeat them without any extra wrapping here.
    local moves = {
      [']f'] = { move.goto_next_start, '@function.outer', 'Next function start' },
      ['[f'] = { move.goto_previous_start, '@function.outer', 'Prev function start' },
      [']F'] = { move.goto_next_end, '@function.outer', 'Next function end' },
      ['[F'] = { move.goto_previous_end, '@function.outer', 'Prev function end' },
      [']C'] = { move.goto_next_start, '@class.outer', 'Next class start' },
      ['[C'] = { move.goto_previous_start, '@class.outer', 'Prev class start' },
    }
    for lhs, spec in pairs(moves) do
      vim.keymap.set({ 'n', 'x', 'o' }, lhs, function() spec[1](spec[2], 'textobjects') end, { desc = spec[3] })
    end

    -- Swap parameters. <leader>s* is the search group but sa/sA are unused.
    vim.keymap.set('n', '<leader>sa', function() swap.swap_next '@parameter.inner' end, { desc = 'Swap parameter with next' })
    vim.keymap.set('n', '<leader>sA', function() swap.swap_previous '@parameter.inner' end, { desc = 'Swap parameter with previous' })

    -- Repeat the last textobject move. `;` normally repeats f/t; these wrappers keep
    -- that behaviour and extend it to the motions above.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', rm.repeat_last_move_next, { desc = 'Repeat last move forward' })
    vim.keymap.set({ 'n', 'x', 'o' }, '<M-;>', rm.repeat_last_move_previous, { desc = 'Repeat last move backward' })

    -- Keep f/F/t/T repeatable through ; as well.
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', rm.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', rm.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', rm.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', rm.builtin_T_expr, { expr = true })
  end,
}

---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-telescope/telescope.nvim',
    -- This config runs after the kickstart telescope config (custom plugins load last).
    -- We reclaim <leader>ss for clangd, expose telescope builtin under <leader>SS,
    -- and override <leader>sc to search the git repo root.
    config = function()
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>SS', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>ss', ':LspClangdSwitchSourceHeader<CR>', { desc = 'Clangd [s]witch [s]ource/header' })
      vim.keymap.set('n', '<leader>sc', function()
        local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
        builtin.find_files { cwd = git_root }
      end, { desc = '[S]earch git repo root' })
      vim.keymap.set('n', '<leader>sR', function()
        builtin.find_files { cwd = '~/repos/' }
      end, { desc = '[S]earch [R]epos folder' })
    end,
  },
}

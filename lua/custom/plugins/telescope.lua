---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-telescope/telescope.nvim',
    -- lazy.nvim does NOT merge `config` across specs -- the last fragment shadows the rest
    -- (lua/lazy/core/meta.lua chains fragments via __index). Custom plugins import last, so
    -- this config must call kickstart's explicitly or telescope.setup{} and every <leader>s*
    -- keymap it defines silently vanish.
    -- We reclaim <leader>ss for clangd, expose telescope builtin under <leader>SS,
    -- and override <leader>sc to search the git repo root.
    config = function(plugin, opts)
      require('kickstart.plugins.telescope')[1].config(plugin, opts)

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

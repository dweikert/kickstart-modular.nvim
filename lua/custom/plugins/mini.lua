-- Adds mini.files to the mini.nvim modules kickstart already sets up.
--
-- lazy.nvim does NOT merge `config` across specs -- the last fragment shadows the
-- rest (lua/lazy/core/meta.lua chains fragments via __index). Custom plugins import
-- last, so this must call kickstart's config explicitly or mini.ai, mini.surround
-- and mini.statusline all silently vanish. Same pattern as custom/plugins/telescope.lua
-- and custom/plugins/lspconfig.lua.
--
-- mini.files over oil.nvim purely because mini.nvim is already installed: same
-- edit-the-filesystem-as-a-buffer capability, zero new dependencies.

---@module 'lazy'
---@type LazySpec
return {
  'nvim-mini/mini.nvim',
  -- REQUIRED: adding `keys` below makes lazy.nvim infer lazy=true for the whole
  -- merged spec, which would defer mini.nvim until `-` is pressed and silently take
  -- mini.ai, mini.surround and mini.statusline offline at startup. Kickstart's
  -- fragment declares no loader, so it relied on the default eager load.
  lazy = false,
  keys = {
    -- `-` to open the parent directory is the vim-vinegar/oil convention.
    -- Replaces the old <leader>pv netrw binding, which had become an ambiguous
    -- prefix of <leader>p (paste) and cost 'timeoutlen' on every paste.
    {
      '-',
      function() require('mini.files').open(vim.api.nvim_buf_get_name(0), true) end,
      desc = 'Open mini.files (directory of current file)',
    },
    {
      '<leader>-',
      function() require('mini.files').open(vim.uv.cwd(), true) end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function(plugin, opts)
    require('kickstart.plugins.mini')[1].config(plugin, opts)

    -- Edit the filesystem like a buffer: rename with `cw`, delete with `dd`,
    -- create by adding a line, then `=` to apply the whole batch.
    require('mini.files').setup {
      mappings = { synchronize = '=' },
      windows = { preview = true, width_preview = 60 },
    }
  end,
}

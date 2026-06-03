---@module 'lazy'
---@type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      -- Override format_on_save to enable Lua and Python
      format_on_save = function(bufnr)
        local enabled_filetypes = { lua = true, python = true }
        return enabled_filetypes[vim.bo[bufnr].filetype] and { timeout_ms = 500 } or nil
      end,
      formatters_by_ft = {
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
      },
    },
  },
}

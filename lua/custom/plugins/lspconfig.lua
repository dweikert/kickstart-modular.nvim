---@module 'lazy'
---@type LazySpec
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'mason-org/mason.nvim',
        -- Deep-merged with kickstart's opts = {} to add the Crashdummyy registry (needed for roslyn).
        opts = {
          registries = {
            'github:mason-org/mason-registry',
            'github:Crashdummyy/mason-registry',
          },
        },
      },
    },
    -- This config runs after the kickstart lspconfig config.
    config = function()
      local servers = {
        clangd = {},
        basedpyright = {
          settings = { autoImportCompletion = true },
        },
      }
      for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
      -- Re-call mason-tool-installer with the full set so custom tools survive a fresh install.
      -- Includes upstream tools (stylua, lua_ls) so they are not lost if this call replaces the first.
      require('mason-tool-installer').setup {
        ensure_installed = {
          'stylua',
          'lua_ls',
          'clangd',
          'basedpyright',
          'isort',
          'ruff',
        },
      }
    end,
  },
}

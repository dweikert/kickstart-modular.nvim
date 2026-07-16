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
    -- lazy.nvim does NOT merge `config` across specs -- the last fragment shadows the rest.
    -- Custom plugins import last, so this must call kickstart's config explicitly or the
    -- kickstart-lsp-attach augroup (grn/gra/grD/<leader>th) and the lua_ls/stylua setup
    -- are all silently dropped.
    config = function(plugin, opts)
      require('kickstart.plugins.lspconfig')[1].config(plugin, opts)

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

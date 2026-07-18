-- Ruff LSP for python. Enabled in lua/custom/plugins/lspconfig.lua.
-- Merged into nvim's builtin lsp/ config lookup (`:help lsp-config`).
--
-- basedpyright also attaches to python and is the better hover/type source, so ruff's
-- hover is switched off to avoid two overlapping popups. This used to be a top-level
-- nvim_create_autocmd() call stuffed into element [1] of this table, which registered a
-- global autocmd as a side effect of loading the file; on_attach does the same job here.
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  on_attach = function(client) client.server_capabilities.hoverProvider = false end,
  init_options = {
    settings = {
      args = { '--select=E,F,W,I,N', '--extend-select=B,UP' },
    },
  },
}

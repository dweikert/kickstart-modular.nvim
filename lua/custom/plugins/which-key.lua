-- Document the key-chain prefixes added by the custom layer. `opts` deep-merges
-- across fragments (unlike `config`), so this is additive to
-- lua/kickstart/plugins/which-key.lua rather than replacing its spec.

---@module 'lazy'
---@type LazySpec
return {
  'folke/which-key.nvim',
  opts = {
    spec = {
      { '<leader>F', group = '[F]ind/replace (grug-far)' },
      { '<leader>r', group = 'Session [r]estore' },
      { '<leader>d', group = '[D]iffview' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>i', group = 'Inara' },
    },
  },
}

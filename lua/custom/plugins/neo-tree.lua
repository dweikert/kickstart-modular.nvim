-- Personal neo-tree layer. The plugin declaration, dependencies and the `\` reveal
-- keymap live in lua/kickstart/plugins/neo-tree.lua (upstream -- don't edit it, or
-- `git pull upstream` conflicts). lazy.nvim merges `keys` and deep-merges `opts`
-- across fragments, so everything here is additive to that file.
--
-- NOTE: `config` is the one field lazy does NOT merge -- see the comments in
-- custom/plugins/telescope.lua and lspconfig.lua for that trap.
--
-- Merged in from the former custom/plugins/filetree.lua, which declared this same
-- plugin just to add <leader>e.

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'NeoTree toggle' },
    { '<leader>gs', ':Neotree float git_status<CR>', desc = 'NeoTree git status' },
    { '<leader>b', ':Neotree toggle show buffers right<CR>', desc = 'NeoTree buffers' },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,

    -- Top-level `window` is inherited by every source (filesystem, buffers,
    -- git_status), so these git actions work from the file tree too. This block was
    -- previously copy-pasted into filesystem.window and git_status.window as well;
    -- the git_status copy was identical to neo-tree's own defaults.
    window = {
      mappings = {
        ['<space>'] = { 'toggle_node', nowait = false },
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
      },
    },

    -- Component styling belongs under `default_component_configs` -- in
    -- neo-tree/defaults.lua both `name` and `git_status.symbols` are nested there.
    -- These used to sit at top level, where neo-tree ignores them, so the glyphs
    -- below never actually rendered.
    default_component_configs = {
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName',
      },
      git_status = {
        symbols = {
          added = '✚',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    },

    -- Top-level `git_status` is the *source* config, distinct from the component
    -- config above; `window` is the valid key here.
    git_status = {
      window = { position = 'float' },
    },
  },
}

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  keys = {
    { '<leader>gs', ':Neotree float git_status<CR>', desc = 'NeoTree git status' },
    { '<leader>b', ':Neotree toggle show buffers right<CR>', desc = 'NeoTree buffers' },
  },
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
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
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    git_status = {
      name = { use_git_status_colors = true },
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
      window = {
        position = 'float',
        mappings = {
          ['gu'] = 'git_unstage_file',
          ['ga'] = 'git_add_file',
          ['gr'] = 'git_revert_file',
          ['gc'] = 'git_commit',
          ['gp'] = 'git_push',
          ['gg'] = 'git_commit_and_push',
          ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
          ['oc'] = { 'order_by_created', nowait = false },
          ['od'] = { 'order_by_diagnostics', nowait = false },
          ['om'] = { 'order_by_modified', nowait = false },
          ['on'] = { 'order_by_name', nowait = false },
          ['os'] = { 'order_by_size', nowait = false },
          ['ot'] = { 'order_by_type', nowait = false },
        },
      },
    },
    filesystem = {
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
    },
  },
}

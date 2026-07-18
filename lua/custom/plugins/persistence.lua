-- Per-directory session save/restore: reopen a project and get your buffers,
-- windows and layout back.
--
-- Sessions are saved automatically on exit; restoring is explicit. <leader>r ("restore")
-- because the conventional <leader>q* would collide with <leader>q (diagnostic loclist,
-- lua/keymaps.lua) and make that key wait 'timeoutlen'.

---@module 'lazy'
---@type LazySpec
return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
  keys = {
    {
      '<leader>rs',
      function() require('persistence').load() end,
      desc = 'Session: restore for this directory',
    },
    {
      '<leader>rl',
      function() require('persistence').load { last = true } end,
      desc = 'Session: restore last',
    },
    {
      '<leader>rd',
      function() require('persistence').stop() end,
      desc = "Session: don't save on exit",
    },
  },
}

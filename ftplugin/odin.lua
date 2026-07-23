-- Odin build/check via :make into the quickfix list.
--
-- Neovim 0.12 already ships odin filetype detection, syntax and a basic ftplugin,
-- but that ftplugin sets only commentstring/comments/suffixesadd -- no makeprg,
-- no errorformat. This fills that slot. Treesitter needs nothing: the FileType
-- autocmd in lua/kickstart/plugins/treesitter.lua auto-installs the `odin` parser
-- on first open.
--
-- Odin compiles a *package* (a directory), not a file, so `%:p:h` -- the directory
-- holding the current buffer -- is the unit to check. Diagnostics go to stderr;
-- the default 'shellpipe' (`2>&1| tee`) already merges it.
vim.bo.makeprg = 'odin check %:p:h'

-- Odin (and odinfmt) use hard tabs, so this is purely how wide a tab *renders*;
-- the bytes on disk are unchanged. Default is 8, which reads as double-indented.
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

-- Odin errors look like:
--   /path/main.odin(3:11) Error: Cannot convert '"oops"' to 'int'
--   <TAB>x: int = "oops"
--   <TAB>         ^~~~~^
-- The trailing `%-G%.%#` discards those two trailing context lines; without it the
-- quickfix list is 2/3 noise. `%t` picks E/W out of `Error:`/`Warning:`.
-- ponytail: verified against real `odin check` output through getqflist().
vim.bo.errorformat = '%f(%l:%c) %t%*[^:]: %m,%f(%l) %t%*[^:]: %m,%-G%.%#'

vim.keymap.set('n', '<leader>m', '<cmd>make<cr>', { buffer = true, desc = 'Odin: check package -> quickfix' })

-- `odin run` output is program stdout, not diagnostics, so it belongs in a terminal
-- rather than the quickfix list. `:terminal` does not expand `%`, hence expand().
-- ponytail: no build/test keymaps until you need them.
-- <leader>r is the which-key session-restore group, so run lives on <leader>R.
vim.keymap.set('n', '<leader>R', function()
  vim.cmd('split | terminal odin run ' .. vim.fn.expand '%:p:h')
end, { buffer = true, desc = 'Odin: run package' })

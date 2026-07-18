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

-- Odin errors look like:
--   /path/main.odin(3:11) Error: Cannot convert '"oops"' to 'int'
--   <TAB>x: int = "oops"
--   <TAB>         ^~~~~^
-- The trailing `%-G%.%#` discards those two trailing context lines; without it the
-- quickfix list is 2/3 noise. `%t` picks E/W out of `Error:`/`Warning:`.
-- ponytail: verified against real `odin check` output through getqflist().
vim.bo.errorformat = '%f(%l:%c) %t%*[^:]: %m,%f(%l) %t%*[^:]: %m,%-G%.%#'

-- ponytail: `odin check` only -- no build/run/test keymaps until you need them.
vim.keymap.set('n', '<leader>m', '<cmd>make<cr>', { buffer = true, desc = 'Odin: check package -> quickfix' })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- netrw's <leader>pv retired in favour of mini.files on `-` (custom/plugins/mini.lua).
-- It was also an ambiguous prefix of <leader>p below, costing 'timeoutlen' per paste.

-- Word-wrap aware j/k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Leader>ww', '<cmd>w<cr><esc>', { desc = 'Save file' })
-- Plain y/p stay on the unnamed register; these opt into the OSC 52 system clipboard.
-- NOTE: terminals cannot be read back over OSC 52, so the paste handler in
-- custom/options.lua returns the *unnamed* register. <leader>p therefore pastes what
-- nvim last yanked, not what another application copied. Use the terminal's own
-- paste (ctrl+shift+v / middle-click) to bring text in from outside.
vim.keymap.set({ 'n', 'v' }, '<Leader>y', '"+y', { desc = 'Copy to clipboard (OSC 52)' })
vim.keymap.set({ 'n', 'v' }, '<Leader>p', '"+p', { desc = 'Paste from clipboard (OSC 52)' })

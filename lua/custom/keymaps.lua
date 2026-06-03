vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'open netrw' })

-- Word-wrap aware j/k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Leader>ww', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set({ 'n', 'v' }, '<Leader>y', '"+y', { desc = 'Copy to clipboard' })

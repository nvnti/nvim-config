local move = require('functions.move')

-- Motion keys
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set('n', '<C-N>', move.next, {})
vim.keymap.set('n', '<C-P>', move.prev, {})

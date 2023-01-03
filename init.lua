-- require("config")
vim.keymap.set("n", ";", [[:]])

require("nvn.packer_plugin")
require("nvn.mapping")
require("nvn.config")
require("nvn.abbreviations")
require("nvn.functions")
require("nvn.telescope")

vim.keymap.set({"n", "v"}, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])
vim.keymap.set("n", ";", [[:]])

vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
vim.cmd('source ~/.config/nvim/vimscript/move.vim')
vim.cmd('source ~/.config/nvim/vimscript/nvimrc.vim')
vim.cmd('source ~/.config/nvim/vimscript/vimrc.vim')
vim.cmd('source ~/.config/nvim/vimscript/tag-generation.vim')

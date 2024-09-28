vim.g.mapleader = ","

require("config")
require("mapping")
require("functions")

vim.keymap.set({ "n", "v" }, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])

vim.keymap.set("n", ";", ":")

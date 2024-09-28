vim.g.mapleader = ","

require("lazy_conf")
require("mapping")
require("config")
require("abbreviations")
require("functions")
require("telescope_local")
require("abbreviations")

require("setup.init").setup()

vim.keymap.set({ "n", "v" }, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])

vim.keymap.set("n", ";", ":")

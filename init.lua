require("nvn.packer_plugin")
require("nvn.mapping")
require("nvn.config")
require("nvn.abbreviations")
require("nvn.functions")
require("nvn.telescope")
require("nvn.abbreviations")

vim.keymap.set({"n", "v"}, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])

-- require("nvn.packer_plugin")
require("nvn.lazy_plugin")
require("nvn.mapping")
require("nvn.config")
require("nvn.abbreviations")
require("nvn.functions")
require("nvn.telescope")
require("nvn.abbreviations")

require("nvn.setup.init").setup()

vim.keymap.set({"n", "v"}, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])

local jobs = require('functions.jobs')
local common = require('functions.common')

vim.keymap.set("n", "\\q", ":qa<CR>")

vim.keymap.set("n", "\\Q", ":cquit<CR>")
vim.keymap.set("n", "\\S", ":PackerSync<CR>")
vim.keymap.set("n", "\\w", ":wa!<CR>")

-- Tag generation
vim.keymap.set("n", "\\Tc", jobs.GenerateCPPTags, {})
vim.keymap.set("n", "\\Tj", jobs.GenerateJavaTags, {})
vim.keymap.set("n", "\\Tp", jobs.GeneratePythonTags, {})
vim.keymap.set("n", "\\Tr", jobs.GenerateRustTags, {})

-- FORMAT
vim.keymap.set("n", "\\ff", common.format_file_normal_mode, {})
vim.keymap.set("v", "\\ff", common.format_file_visual_mode, {})

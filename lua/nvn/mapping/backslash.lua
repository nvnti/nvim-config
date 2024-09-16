local jobs = require('nvn.functions.jobs')
local common = require('nvn.functions.common')

vim.keymap.set("n", "\\q", ":qa<CR>")

vim.keymap.set("n", "\\Q", ":cquit<CR>")
vim.keymap.set("n", "\\S", ":PackerSync<CR>")
vim.keymap.set("n", "\\w", ":wa!<CR>")

-- Tag generation
vim.keymap.set("n", "\\tc", jobs.GenerateCPPTags, {})
vim.keymap.set("n", "\\tj", jobs.GenerateJavaTags, {})
vim.keymap.set("n", "\\tp", jobs.GeneratePythonTags, {})
vim.keymap.set("n", "\\tr", jobs.GenerateRustTags, {})

-- FORMAT
vim.keymap.set("n", "\\ff", common.format_file_normal_mode, {})
vim.keymap.set("v", "\\ff", common.format_file_visual_mode, {})

vim.keymap.set("n", "\\gl", common.open_current_branch_link, {})

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
vim.keymap.set("n", "\\fc", ":ClangFormat<CR>", {})
vim.keymap.set("n", "\\ff", "gg=G``", {})
vim.keymap.set("n", "\\fj", common.format_json, {})
vim.keymap.set("n", "\\fr", ":RustFmt<CR>", {})
vim.keymap.set("n", "\\fx", ":%!XMLLINT_INDENT=\"    \" xmllint --format -<CR>", {})
vim.keymap.set("v", "\\fc", ":ClangFormat<CR>", {})
vim.keymap.set("v", "\\fx", ":'<,'>!XMLLINT_INDENT=\"    \" xmllint --format -<CR>", {})

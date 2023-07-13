vim.keymap.set("n", "\\q", ":qa<CR>")

vim.keymap.set("n", "\\Q", ":cquit<CR>")
vim.keymap.set("n", "\\S", ":PackerSync<CR>")
vim.keymap.set("n", "\\w", ":wa!<CR>")


-- FORMAT
vim.keymap.set("n", "\\fc", ":ClangFormat<CR>", {})
vim.keymap.set("n", "\\ff", "gg=G``", {})
vim.keymap.set("n", "\\fj", ":call FormatJson()<CR>")
vim.keymap.set("n", "\\fr", ":RustFmt<CR>", {})
vim.keymap.set("n", "\\fx", ":%!XMLLINT_INDENT=\"    \" xmllint --format -<CR>", {})
vim.keymap.set("v", "\\fc", ":ClangFormat<CR>", {})
vim.keymap.set("v", "\\fx", ":'<,'>!XMLLINT_INDENT=\"    \" xmllint --format -<CR>", {})

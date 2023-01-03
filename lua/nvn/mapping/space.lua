local builtin = require('telescope.builtin')
local customs = require('nvn.telescope.init')

-- Quickfix list
-- vim.keymap.set("n", "<space>ca", actions.send_to_qflist, {})
vim.keymap.set("n", "<space>cn", ":cn<CR>", {})
vim.keymap.set("n", "<space>co", ":copen<CR>", {})
vim.keymap.set("n", "<space>cp", ":cp<CR>", {})
vim.keymap.set("n", "<space>cq", ":cclose<CR>", {})

-- Diff
vim.keymap.set("n", "<space>Dn", ":EnhancedDiffIgnorePat \\d\\+<CR>", {})
vim.keymap.set("n", "<space>dP", ":DirDiffPrev<CR>", {})
vim.keymap.set("n", "<space>dG", ":%diffget<CR>", {})
vim.keymap.set("n", "<space>dd", ":DirDiffUpdate<CR>", {})
vim.keymap.set("n", "<space>dg", ":diffget<CR>", {})
vim.keymap.set("n", "<space>dn", ":DirDiffNext<CR>", {})
vim.keymap.set("n", "<space>dp", ":diffput<CR>", {})
vim.keymap.set("n", "<space>dq", ":DirDiffQuit<CR>", {})
vim.keymap.set("n", "<space>du", ":diffupdate<CR>", {})
vim.keymap.set("n", "<space>dw", ":call ToggleDiffWhitespace()<CR>", {})

-- Explorer
vim.keymap.set("n", "<space>ef", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<space>ei", function()
  vim.g.nvim_tree_current_width = vim.g.nvim_tree_current_width + 40
  vim.cmd{ cmd = "NvimTreeResize", args = {vim.g.nvim_tree_current_width} }
end)
vim.keymap.set("n", "<space>er", function()
  vim.g.nvim_tree_current_width = 40
  vim.cmd{ cmd = "NvimTreeResize", args = {vim.g.nvim_tree_current_width} }
end)
vim.keymap.set("n", "<space>et", ":NvimTreeToggle<CR>")

-- Files
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.git_files, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<space>fq', builtin.quickfix, {})
vim.keymap.set('n', '<space>fr', builtin.registers, {})
vim.keymap.set('n', '<space>fs', builtin.spell_suggest, {})
vim.keymap.set('n', '<space>ft', builtin.tags, {})
vim.keymap.set('n', '<space>fT', builtin.filetypes, {})

vim.keymap.set("v", "<space>Fc", ":ClangFormat<CR>", {})
vim.keymap.set("n", "<space>Fc", ":ClangFormat<CR>", {})

-- Git
vim.keymap.set("n", "<space>gS", ":DiffviewOpen HEAD..HEAD~1<CR>")
vim.keymap.set("n", "<space>ga", ":Git add %<CR><CR>")
vim.keymap.set("n", "<space>gb", ":Git blame<CR>")
vim.keymap.set("n", "<space>gB", builtin.git_branches, {})
vim.keymap.set("n", "<space>gc", builtin.git_commits, {})
vim.keymap.set("n", "<space>gd", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<space>gh", ":GetCurrentBranchLink<CR>")
vim.keymap.set("n", "<space>gl", ":Git log<CR>")
vim.keymap.set("n", "<space>gp", ":Git pull<CR>")
vim.keymap.set("n", "<space>gq", ":tabclose<CR>")
vim.keymap.set("n", "<space>gs", builtin.git_status, {})
vim.keymap.set("v", "<space>gh", ":GetCurrentBranchLink<CR>")

-- Cargo build
vim.keymap.set("n", "<SPACE>rc", ":make clippy --target-dir=target-analyzer --workspace --all-targets --all-features --all -- -D clippy::perf -D clippy::all -D clippy::needless_lifetimes<CR>", {})
vim.keymap.set("n", "<SPACE>rf", ":RustFmt<CR>", {})
vim.keymap.set("n", "<space>rm", ":make build", {})
vim.keymap.set("n", "<space>rw", ":make build --workspace<CR>", {})

-- Searches
vim.keymap.set('n', '<space>sf', customs.grep_word_in_selected_type, {})
vim.keymap.set('n', '<space>sF', customs.grep_word_under_cursor_in_selected_type, {})
vim.keymap.set('n', '<space>sg', builtin.grep_string, {})
vim.keymap.set('n', '<space>sG', customs.grep_word_in_all_files, {})
vim.keymap.set('n', '<space>sl', builtin.live_grep, {})
vim.keymap.set('n', '<space>sL', customs.live_grep_in_selected_files, {})
vim.keymap.set('n', '<space>sr', customs.grep_word_in_rust, {})
vim.keymap.set('n', '<space>sR', customs.grep_word_under_cursor_in_rust, {})

-- Toggle/tags
vim.keymap.set("n", "<SPACE>t<SPACE>", ":call ToggleCopyMode()<CR>", {})
vim.keymap.set("n", "<SPACE>tc", ":call LoadTagsC()<CR>", {})
vim.keymap.set("n", "<SPACE>tr", ":call LoadTagsRust()<CR>", {})

vim.keymap.set("n", "<SPACE>yp", ":let @\" = expand(\"%\")<CR>", {})


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
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.git_files, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<space>fq', builtin.quickfix, {})
vim.keymap.set('n', '<space>fr', builtin.registers, {})
vim.keymap.set('n', '<space>ft', builtin.tags, {})

-- Searches
vim.keymap.set('n', '<space>sg', builtin.grep_string, {})
vim.keymap.set('n', '<space>sl', builtin.live_grep, {})

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



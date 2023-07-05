local builtin = require('telescope.builtin')
local customs = require('nvn.telescope.init')
local custom_term_toggles = require('nvn.toggleterm.init')
local custom_toggles = require('nvn.config.toggles')

vim.keymap.set("n", "<space>an", ":AerialNext float<CR>", {})
vim.keymap.set("n", "<space>ao", ":AerialOpen float<CR>", {})
vim.keymap.set("n", "<space>ap", ":AerialPrev float<CR>", {})
vim.keymap.set("n", "<space>aq", ":AerialCloseAll<CR>", {})
vim.keymap.set("n", "<space>at", ":AerialToggle float<CR>", {})

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
vim.keymap.set('n', '<SPACE>dw', custom_toggles.toggle_diff_whitespace, {})

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

-- Git
vim.keymap.set("n", "<space>gA", ":Git commit --amend<CR>")
vim.keymap.set("n", "<space>gB", builtin.git_branches, {})
vim.keymap.set("n", "<space>gC", ":Git commit<CR>")
vim.keymap.set("n", "<space>gS", ":DiffviewOpen HEAD..HEAD~1<CR>")
vim.keymap.set("n", "<space>ga", ":Git add %<CR><CR>")
vim.keymap.set("n", "<space>gb", ":Git blame<CR>")
vim.keymap.set("n", "<space>gc", builtin.git_commits, {})
vim.keymap.set("n", "<space>gd", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<space>gh", ":GetCurrentBranchLink<CR>")
vim.keymap.set("n", "<space>gl", ":Git log<CR>")
vim.keymap.set("n", "<space>gp", ":Git pull<CR>")
vim.keymap.set("n", "<space>gq", ":tabclose<CR>")
vim.keymap.set("n", "<space>gs", builtin.git_status, {})
vim.keymap.set("v", "<space>gh", ":GetCurrentBranchLink<CR>")

-- Cargo build
vim.keymap.set("n", "<space>rm", ":make build", {})
vim.keymap.set("n", "<space>rt", ":make test --workspace --features dev<CR>", {})
vim.keymap.set("n", "<space>rw", ":make build --workspace --features dev<CR>", {})

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
vim.keymap.set('n', '<SPACE>tf', custom_toggles.toggle_rust_fmt, {})
-- vim.keymap.set('n', '<SPACE>tg', custom_toggles.toggle_c_cpp_source_header, {})
vim.keymap.set("n", "<SPACE>tr", ":call LoadTagsRust()<CR>", {})
-- vim.keymap.set('n', '<SPACE>tw', custom_toggles.toggle_text_width_line, {})

vim.keymap.set("n", "<SPACE>yp", ":let @\" = expand(\"%\")<CR>", {})

vim.keymap.set("n", "<SPACE>zB", custom_term_toggles.load_cargo_build_errors, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zC", custom_term_toggles.load_clippy_errors, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zT", custom_term_toggles.load_cargo_test_errors, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zb", custom_term_toggles.cargo_build, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zc", custom_term_toggles.cclippy_toggle, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zf", custom_term_toggles.cfmt_toggle, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zg", custom_term_toggles.lazygit_toggle, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zh", custom_term_toggles.htop_toggle, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zt", custom_term_toggles.cargo_test, {noremap = true, silent = true})
vim.keymap.set("n", "<SPACE>zu", custom_term_toggles.cfmt_update_toggle, {noremap = true, silent = true})

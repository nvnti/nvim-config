local builtin = require('telescope.builtin')
local customs = require('config.telescope_local')
local custom_term_toggles = require('config.toggleterm_conf')
local custom_toggles = require('config.toggles')
local map_silent = require('utils').map_silent

map_silent("n", "<space>an", ":AerialNext float<CR>", ":AerialNext float<CR>")
map_silent("n", "<space>ao", ":AerialOpen float<CR>", ":AerialOpen float<CR>")
map_silent("n", "<space>ap", ":AerialPrev float<CR>", ":AerialPrev float<CR>")
map_silent("n", "<space>aq", ":AerialCloseAll<CR>", ":AerialCloseAll<CR>")
map_silent("n", "<space>at", ":AerialToggle float<CR>", ":AerialToggle float<CR>")

-- Quickfix list
-- vim.keymap.set("n", "<space>ca", actions.send_to_qflist, {})
map_silent("n", "<space>cn", ":cn<CR>", ":cn<CR>")
map_silent("n", "<space>co", ":copen<CR>", ":copen<CR>")
map_silent("n", "<space>cp", ":cp<CR>", ":cp<CR>")
map_silent("n", "<space>cq", ":cclose<CR>", ":cclose<CR>")

-- Diff
map_silent("n", "<space>Dn", ":EnhancedDiffIgnorePat \\d\\+<CR>", ":EnhancedDiffIgnorePat \\d\\+<CR>")
map_silent("n", "<space>dP", ":DirDiffPrev<CR>", ":DirDiffPrev<CR>")
map_silent("n", "<space>dG", ":%diffget<CR>", ":%diffget<CR>")
map_silent("n", "<space>dd", ":DirDiffUpdate<CR>", ":DirDiffUpdate<CR>")
map_silent("n", "<space>dg", ":diffget<CR>", ":diffget<CR>")
map_silent("n", "<space>dn", ":DirDiffNext<CR>", ":DirDiffNext<CR>")
map_silent("n", "<space>dp", ":diffput<CR>", ":diffput<CR>")
map_silent("n", "<space>dq", ":DirDiffQuit<CR>", ":DirDiffQuit<CR>")
map_silent("n", "<space>du", ":diffupdate<CR>", ":diffupdate<CR>")
map_silent('n', '<SPACE>dw', custom_toggles.toggle_diff_whitespace, "toggle_diff_whitespace")

-- Explorer
vim.keymap.set("n", "<space>ef", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<space>ei", function()
  vim.g.nvim_tree_current_width = vim.g.nvim_tree_current_width + 40
  vim.cmd { cmd = "NvimTreeResize", args = { vim.g.nvim_tree_current_width } }
end)
vim.keymap.set("n", "<space>er", function()
  vim.g.nvim_tree_current_width = 40
  vim.cmd { cmd = "NvimTreeResize", args = { vim.g.nvim_tree_current_width } }
end)
vim.keymap.set("n", "<space>et", ":NvimTreeToggle<CR>")

-- Files
map_silent('n', '<space>fb', builtin.buffers, "buffers")
map_silent('n', '<space>fc', builtin.colorscheme, "colorscheme")
map_silent('n', '<space>ff', builtin.find_files, "find_files")
map_silent('n', '<space>fg', builtin.git_files, "git_files")
map_silent('n', '<space>fh', builtin.help_tags, "help_tags")
map_silent('n', '<space>fq', builtin.quickfix, "quickfix")
map_silent('n', '<space>fr', builtin.registers, "registers")
map_silent('n', '<space>fs', builtin.spell_suggest, "spell_suggest")
map_silent('n', '<space>ft', builtin.tags, "tags")
map_silent('n', '<space>fT', builtin.filetypes, "filetypes")

-- Git
map_silent("n", "<space>gA", ":Git commit --amend<CR>", ":Git commit --amend<CR>")
map_silent("n", "<space>gB", builtin.git_branches, "git_branches")
map_silent("n", "<space>gC", ":Git commit<CR>", ":Git commit<CR>")
map_silent("n", "<space>ga", ":Git add %<CR><CR>", ":Git add %<CR><CR>")
map_silent("n", "<space>gb", ":Git blame<CR>", ":Git blame<CR>")
map_silent("n", "<space>gc", builtin.git_commits, "git_commits")
map_silent("n", "<space>gh", ":GetCurrentBranchLink<CR>", ":GetCurrentBranchLink<CR>")
map_silent("n", "<space>gl", ":Git log<CR>", ":Git log<CR>")
map_silent("n", "<space>gp", ":Git pull<CR>", ":Git pull<CR>")
map_silent("n", "<space>gq", ":tabclose<CR>", ":tabclose<CR>")
map_silent("n", "<space>gs", builtin.git_status, "git_status")
map_silent("v", "<space>gh", ":GetCurrentBranchLink<CR>", ":GetCurrentBranchLink<CR>")

-- Cargo build
map_silent("n", "<space>rm", ":make build", ":make build")
map_silent("n", "<space>rt", ":make test --workspace --features dev<CR>",
  ":make test --workspace --features dev<CR>")
map_silent("n", "<space>rw", ":make build --workspace --features dev<CR>",
  ":make build --workspace --features dev<CR>")

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
vim.keymap.set('n', '<SPACE>t<SPACE>', custom_toggles.toggle_copy_mode, {})
vim.keymap.set('n', '<SPACE>tf', custom_toggles.toggle_rust_fmt, {})
vim.keymap.set('n', '<SPACE>tt', custom_toggles.toggle_tab_width, {})

-- vim.keymap.set('n', '<SPACE>tg', custom_toggles.toggle_c_cpp_source_header, {})
-- vim.keymap.set('n', '<SPACE>tw', custom_toggles.toggle_text_width_line, {})

vim.keymap.set("n", "<space>vh", ":DiffviewOpen HEAD..HEAD~1<CR>")
vim.keymap.set("n", "<space>vo", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<space>vq", ":DiffviewClose<CR>")

vim.keymap.set("n", "<SPACE>yp", ":let @\" = expand(\"%\")<CR>", {})

vim.keymap.set("n", "<SPACE>zB", custom_term_toggles.load_cargo_build_errors,
  { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zC", custom_term_toggles.load_clippy_errors,
  { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zT", custom_term_toggles.load_cargo_test_errors,
  { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zb", custom_term_toggles.cargo_build, { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zc", custom_term_toggles.cclippy_toggle,
  { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zF", custom_term_toggles.cclippy_fix_toggle,
  { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zf", custom_term_toggles.cfmt_toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zg", custom_term_toggles.lazygit_toggle,
  { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zh", custom_term_toggles.htop_toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zt", custom_term_toggles.cargo_test, { noremap = true, silent = true })
vim.keymap.set("n", "<SPACE>zu", custom_term_toggles.cfmt_update_toggle,
  { noremap = true, silent = true })

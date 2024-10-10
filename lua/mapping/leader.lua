vim.g.mapleader = ","

local toggler = require("config.toggler")
local map = require('utils').map

-- DELETE / DIFF
-- vim.keymap.set("n", "<leader>dc", ":%!tr -cd '[:print:]\n'<CR>", {})
-- vim.keymap.set("n", "<leader>dl", ":g//d<LEFT><LEFT>", {})
-- vim.keymap.set("n", "<leader>dp", ":g/<C-R>=expand(\"<cword>\")<CR>/d<CR>", {})
map("n", "<leader>ds", ":StripWhitespace<CR>", "Strip white spaces.")

map("n", "<leader>ez", "yyp:.!zsh<CR>", "Execute current line in zsh.")

map("n", "<leader>fa", ":grep <C-R>=expand(\"<cword>\")<CR>", "Search current word in ...")
map("n", "<leader>fc",
  ":grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand(\"<cword>\")<CR> analysis/",
  "Search current word in <prevent>/analysis")
map("n", "<leader>fg", ":grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}'", "Search in C/CPP/H/HPP")
map("n", "<leader>fja", ":grep -g '{*.java}' <C-R>=expand(\"<cword>\")<CR> .",
  "Search current word in java files.")
map("n", "<leader>fjs", ":grep -g '{*.json}' <C-R>=expand(\"<cword>\")<CR> .",
  "Search current word in JSON file.")
map("n", "<leader>fm", ":grep -g '{*.mk,Makefile}' <C-R>=expand(\"<cword>\")<CR> .",
  "Search current word in Makefiles.")
map("n", "<leader>fp", ":grep -g '{*.py}' <C-R>=expand(\"<cword>\")<CR> .",
  "Search current word in Python files.")
map("n", "<leader>fr", ":grep -g '{*.rs}' <C-R>=expand(\"<cword>\")<CR> .",
  "Search current word in Rust files.")
map("n", "<leader>ft", ":grep -g '{Cargo.toml}' <C-R>=expand(\"<cword>\")<CR> .",
  "Search current word in toml files.")

map("n", "<leader>gc", ":e <cfile><CR>", "Go to file under cursor.")
map("n", "<leader>gf", ":e <C-R>=expand(\"%:h\")<CR>/<cfile><CR>", "Go to files under cursor.")
map("n", "<leader>gt", ":e test-sources/<cfile><CR>", "Go to file under cursor in test-sources.")

-- Open
map("n", "<leader>op", ":e <C-R>=expand(\"%:h\")<CR>/", "Open file in current directory.")

-- paste / previos
-- paste but retain
-- replace the line with yanked line
--    vim.keymap.set("n", "<leader>pb", ":bp<CR>", {})
--    vim.keymap.set("n", "<leader>pc", ":cp<CR>", {})
--    vim.keymap.set("n", "<leader>pf", "?{<CR>w99[{", {})
--    vim.keymap.set("n", "<leader>pl", "V\"0p", {})
--    vim.keymap.set("n", "<leader>pt", ":tp<CR>", {})
--    vim.keymap.set("n", "<leader>pw", "ciw<C-r>0<ESC>", {})

-- toggle highlight current line
map("n", "<leader>tf", ":call SwitchBetweenSourceHeader()<CR>",
  "Toggler between C/CPP source and header")
map("n", "<leader>th", ":set invcursorline<CR>", "Toggle cursor line.")
map("n", "<leader>tl", ":set invnumber<CR>:set invrelativenumber<CR>", "Toggle relative number")
map("n", "<leader>tp", ":set invpaste<CR>", "Toggle paste.")
map("n", "<leader>tr", ":set list!<CR>", "Toggle hidden character.")
map('n', '<leader>tb', toggler.toggle_buffer_formatter, "Toggle formatting for current buffer.")
map('n', '<leader>td', toggler.show_content, "Show toggler map.")
map('n', '<leader>tt', toggler.toggle_filetype_formatter, "Toggle formatting for current file type.")

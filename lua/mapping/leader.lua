vim.g.mapleader = ","

-- DELETE / DIFF
vim.keymap.set("n", "<leader>dc", ":%!tr -cd '[:print:]\n'<CR>", {})
vim.keymap.set("n", "<leader>dl", ":g//d<LEFT><LEFT>", {})
vim.keymap.set("n", "<leader>dp", ":g/<C-R>=expand(\"<cword>\")<CR>/d<CR>", {})
vim.keymap.set("n", "<leader>ds", ":StripWhitespace<CR>", {})

vim.keymap.set("n", "<leader>ez", "yyp:.!zsh<CR>")

vim.keymap.set("n", "<leader>fa",  ":grep <C-R>=expand(\"<cword>\")<CR>")
vim.keymap.set("n", "<leader>fc",  ":grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand(\"<cword>\")<CR> analysis/")
vim.keymap.set("n", "<leader>fg",  ":grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}'")
vim.keymap.set("n", "<leader>fja", ":grep -g '{*.java}' <C-R>=expand(\"<cword>\")<CR> .")
vim.keymap.set("n", "<leader>fjs", ":grep -g '{*.json}' <C-R>=expand(\"<cword>\")<CR> .")
vim.keymap.set("n", "<leader>fm",  ":grep -g '{*.mk,Makefile}' <C-R>=expand(\"<cword>\")<CR> .")
vim.keymap.set("n", "<leader>fp",  ":grep -g '{*.py}' <C-R>=expand(\"<cword>\")<CR> .")
vim.keymap.set("n", "<leader>fs",  ":grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand(\"<cword>\")<CR> analysis/ <CR>")
vim.keymap.set("n", "<leader>fr",  ":grep -g '{*.rs}' <C-R>=expand(\"<cword>\")<CR> .")
vim.keymap.set("n", "<leader>ft",  ":grep -g '{Cargo.toml}' <C-R>=expand(\"<cword>\")<CR> .")

vim.keymap.set("n", "<leader>gc", ":e <cfile><CR>")
vim.keymap.set("n", "<leader>gf", ":e <C-R>=expand(\"%:h\")<CR>/<cfile><CR>")
vim.keymap.set("n", "<leader>gt", ":e test-sources/<cfile><CR>")

-- next
vim.keymap.set("n", "<leader>nb", ":bn<CR>", {})
vim.keymap.set("n", "<leader>nc", ":cn<CR>", {})
vim.keymap.set("n", "<leader>nf", "j0[[%/{<CR>", {})
vim.keymap.set("n", "<leader>nt", ":tn<CR>", {})

-- Open
vim.keymap.set("n", "<leader>op", ":e <C-R>=expand(\"%:h\")<CR>/")

-- paste / previos
-- paste but retain
-- replace the line with yanked line
vim.keymap.set("n", "<leader>pb", ":bp<CR>", {})
vim.keymap.set("n", "<leader>pc", ":cp<CR>", {})
vim.keymap.set("n", "<leader>pf", "?{<CR>w99[{", {})
vim.keymap.set("n", "<leader>pl", "V\"0p", {})
vim.keymap.set("n", "<leader>pt", ":tp<CR>", {})
vim.keymap.set("n", "<leader>pw", "ciw<C-r>0<ESC>", {})

-- reload
vim.keymap.set("n", "<leader>rd", ":diffupdate<CR>", {})
vim.keymap.set("n", "<leader>rf", ":e %:p<CR>", {})
vim.keymap.set("n", "<leader>rv", ":source ~/.vimrc<CR>", {})

-- See global vars
-- nnoremap <leader>ta :ToggleLocationList<CR>

-- toggle highlight current line
vim.keymap.set("n", "<leader>th", ":set invcursorline<CR>", {})
vim.keymap.set("n", "<leader>tf", ":call SwitchBetweenSourceHeader()<CR>", {})
vim.keymap.set("n", "<leader>tl", ":set invnumber<CR>:set invrelativenumber<CR>", {})
vim.keymap.set("n", "<leader>tp", ":set invpaste<CR>", {})
vim.keymap.set("n", "<leader>tr", ":set list!<CR>", {})
vim.keymap.set("n", "<leader>tt", ":TagbarToggle<CR>")


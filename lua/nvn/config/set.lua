vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Column limits
vim.opt.textwidth = 85
vim.opt.colorcolumn = "85"
-- Git Gutter always shows
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.history = 100

-- split options
vim.opt.splitright = true
-- set autoread
vim.opt.autoread = true
vim.opt.autowrite = true

vim.opt.shell = "/bin/zsh"

vim.opt.conceallevel = 0

-- See help fo
vim.opt.formatoptions = "cqrnj1"

-- Make sure you have tags in PWD
vim.opt.tags = "./tags"

vim.opt.cmdheight = 1

vim.opt.shortmess = "filnxtToOCFIc"

vim.opt.mouse = "a"

-- allow backspacing over everything in insert mode
vim.opt.backspace = "indent,eol,start"
-- Using status bar plugins, do not show mode
vim.opt.showmode = false

-- -- Set gui options
-- -- remove the right scrollbar
-- set guioptions-=r
-- -- remove the left scrollbar
-- set guioptions-=L
-- -- remove the bottom scrollbar
-- set guioptions-=b
-- set guioptions+=c
-- set guioptions-=m
-- set guioptions-=T


-- Add dictionary
vim.opt.dictionary = "~/.myconfig/dictionary.txt"
vim.opt.thesaurus = "~/.myconfig/words.txt"

-- Command tab completion
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = "*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__,.git"
vim.opt.wildmenu = true

vim.opt.list = true

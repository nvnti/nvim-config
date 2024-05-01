vim.opt.guicursor = ""

vim.opt.number = true -- But show the actual number for the line we're on
vim.opt.relativenumber = true -- Show line numbers

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true
vim.opt.smartcase = true -- ... unless there is a capital letter in the query
vim.opt.smarttab = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
vim.opt.incsearch = true -- Makes search act like search in modern browsers
vim.opt.showmatch = true -- show matching brackets when text indicator is over them

vim.opt.termguicolors = true

vim.opt.scrolloff = 4 -- Make it so there are always ten lines below my cursor
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50 -- Make updates happen faster

-- Column limits
vim.opt.textwidth = 85
vim.opt.colorcolumn = "85"
-- Git Gutter always shows
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.hidden = true -- I like having buffers stay around
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.laststatus = 2
vim.opt.history = 100

-- split options
vim.opt.splitright = true -- Prefer windows splitting to the right
-- set autoread
vim.opt.autoread = true
vim.opt.autowrite = true

vim.opt.shell = "/bin/zsh"

vim.opt.conceallevel = 0

-- See help fo
vim.opt.formatoptions = "cqrnj1"

-- Make sure you have tags in PWD
vim.opt.tags = "tags"

vim.opt.cmdheight = 1

vim.opt.shortmess = "filnxtToOCFIc"

vim.opt.mouse = "a"

-- allow backspacing over everything in insert mode
vim.opt.backspace = "indent,eol,start"
-- Using status bar plugins, do not show mode
vim.opt.showmode = false
vim.opt.showcmd = true

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
vim.opt.pumblend = 17
vim.opt.wildignore = "*.pyc,*.o,*~i,*pycache*,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__,.git,Cargo.lock"
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.wildoptions = "pum"

vim.opt.list = true

vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

vim.cmd("colorscheme OceanicNext")

vim.g.loaded_matchparen = 1

vim.opt.equalalways = false -- I don't like my windows changing all the time
vim.opt.splitbelow = true -- Prefer windows splitting to the bottom

-- Cursorline highlighting control
--  Only have it on in the active buffer
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Tabs
vim.opt.cindent = true

vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

vim.opt.belloff = "all" -- Just turn the dang bell off

vim.opt.clipboard = "unnamedplus"

vim.opt.inccommand = "split"
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
vim.opt.formatoptions = vim.opt.formatoptions
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
vim.opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
vim.opt.fillchars = { eob = "~" }

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

vim.opt.undofile = true
vim.opt.signcolumn = "yes"

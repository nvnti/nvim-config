set nocompatible

" Display hidden characters
nnoremap ; :

" === Tab and newline behavior ===
" Auto-indent after newline (ai)
set autoindent
" Expand tabs to spaces (et)
set expandtab
" Set the shift width, for block indenting/unindenting (sw)
set shiftwidth=2
" Backspace will delete this many spaces instead of just one (sts)
set softtabstop=2
" Set tab width (ts)
set tabstop=2
" Use smart case for searching (scs)
set smartcase
set smarttab

" allow the unsaved buffers to be hidden
set hidden

set shortmess+=I
set shortmess+=c
set cmdheight=1

" clipboard sharing
" set clipboard=unnamed
" clipboard sharing not required, causes slowness
set clipboard=

" if has#colorscheme('solarized')
"     colorscheme solarized
" endif

" Enable syntax highlighting
syntax enable
filetype plugin indent on

set nohlsearch

" Highlight the line the cursor is on.
set cursorline

" show the cursor position all the time
" set ruler

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enable mouse
set mouse=a

" make vim case insensitive
set ignorecase
" Turn on incremental search (is)
set incsearch
" Show status line (ls): 0 (never), 1 (only when >1 window open), 2 (always)
set laststatus=2
" Keep longer history of commands (hi)
set history=50

" stop the bell sound
set noerrorbells
" stop the visual errors also
set novisualbell

" Using status bar plugins, do not show mode
set noshowmode

" Set gui options
" remove the right scrollbar
set guioptions-=r
" remove the left scrollbar
set guioptions-=L
" remove the bottom scrollbar
set guioptions-=b
set guioptions+=c
set guioptions-=m
set guioptions-=T

" Git Gutter always shows
set signcolumn=yes

" split options
set splitright
" set autoread
set autoread
set autowrite

" Add dictionary
set dictionary=~/.myconfig/dictionary.txt
set thesaurus=~/.myconfig/words.txt

" Command tab completion
set wildmode=list:longest,full
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__,.git
set wildmenu

set list
set listchars=tab:▸\
"set listchars=tab:▸\ ,eol:¬

set number
set relativenumber

set conceallevel=0

" Undo function after reopening
set undofile

" Column limits
set textwidth=85
" set colorcolumn=85

" accelerated scrolling
set scrolljump=-15

" See help fo
set formatoptions=cqrnj1

" set completeopt=menuone,noinsert,noselect
" set completeopt=menu,menuone,preview,noselect

" Force map ; -> :
nnoremap ; :
vnoremap ; :

set nocscopetag
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Make sure you have tags in PWD
set tags=tags

set updatetime=300

set shell=/bin/sh

autocmd BufEnter *.nvim :set filetype=vim
autocmd BufEnter *.jinja :set filetype=html
autocmd BufRead,BufNewFile *.toml,*.rs,*.lua,*.vim,*.nvim setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.hpp,*.cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tagbar,nerdtree,NvimTree setlocal signcolumn=no

autocmd SwapExists * let v:swapchoice = "o"

if executable("rg")
    set grepprg=rg\ --column\ --line-number\ --ignore-case\ --no-ignore-vcs\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
else
    echoerr "Please install ripgrep!"
endif

nnoremap <leader>fa :grep <C-R>=expand("<cword>")<CR>
nnoremap <leader>fc : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand("<cword>")<CR> analysis/
nnoremap <leader>fg : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}'
nnoremap <leader>fja : grep -g '{*.java}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fjs : grep -g '{*.json}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fm : grep -g '{*.mk,Makefile}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fp : grep -g '{*.py}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fs : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand("<cword>")<CR> analysis/ <CR>
nnoremap <leader>fr : grep -g '{*.rs}' <C-R>=expand("<cword>")<CR> .

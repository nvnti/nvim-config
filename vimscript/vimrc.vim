" Enable syntax highlighting
syntax enable
filetype plugin indent on

autocmd SwapExists * let v:swapchoice = "o"

if executable("rg")
    set grepprg=rg\ --column\ --line-number\ --ignore-case\ --no-ignore-vcs\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
else
    echoerr "Please install ripgrep!"
endif

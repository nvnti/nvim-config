" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! StringLTrunc(pathStr, reqLen)
    let totLen=strdisplaywidth(a:pathStr)
    if totLen > a:reqLen
        return a:pathStr[totLen-a:reqLen:totLen]
    else
        return a:pathStr
    endif
endfunction

function! GetCharASCIIUnderCursor()
    " Save what's in the `z` register and clear it
    let x = @z
    let @z = ""

    " Redirect output to the `z` register
    redir @z

    " Run the `ascii` command to get all of the interesting character information
    silent! ascii
    redir END

    " Clean up the output and split the line
    let line = substitute(substitute(@z, '^.*> ', '', ''), ',', '', 'g')
    let list = split(line)

    " Reset the `z` register
    let @z = x

    " `dec` and `hex` hold the values I want
    let dec = 0
    let hex = 0

    " If we've split something reasonable, then get decimal and hex values
    if len(list) >= 4
        let dec = list[0]
        let hex = list[2]
    endif

    return dec
endfunction

function! GetCurrentFilePath()
    let curpath=expand('%:p:h')
    if len(curpath) < 1
        curpath = '.'
    endif
    return curpath
endfunction

function! SwitchBetweenSourceHeader()
    if (expand ("%:e") == "cpp")
        if filereadable(expand("%<") . ".h")
            execute ":e %<.h"
        elseif filereadable(expand("%<") . ".hpp")
            execute ":e %<.hpp"
        elseif filereadable(expand("%<") . ".hxx")
            execute ":e %<.hxx"
        else
            echom "Could not find related header file"
        endif
    else
        if filereadable(expand("%<") . ".c")
            execute ":e %<.c"
        elseif filereadable(expand("%<") . ".cc")
            execute ":e %<.cc"
        elseif filereadable(expand("%<") . ".cpp")
            execute ":e %<.cpp"
        else
            echom "Could not find related source file"
        endif
    endif
endfunction

function! ToggleDiffWhitespace()
    if &diffopt =~ 'iwhite'
        set diffopt-=iwhite
    else
        set diffopt+=iwhite
    endif
endfunction
command! ToggleDiffWhitespace : call ToggleDiffWhitespace()

function! ToggleTextWidthLine()
    if &textwidth =~ "85"
        set textwidth=120
        set colorcolumn=120
    elseif &textwidth =~ "120"
        set textwidth=0
        set colorcolumn=0
    else
        set textwidth=85
        set colorcolumn=85
    endif
endfunction

function! SetTextOverLength()
    highlight OverLength ctermbg=darkgrey guibg=#592929
    match OverLength /\%90v.*/
endfunction

let g:CVAR_TOGGLE_COPY_MODE="false"
function! ToggleCopyMode()
    if g:CVAR_TOGGLE_COPY_MODE == "false"
        let g:CVAR_TOGGLE_COPY_MODE="true"
        set signcolumn=no
        set nonumber
        set norelativenumber
        set nolist
    else
        let g:CVAR_TOGGLE_COPY_MODE="false"
        set signcolumn=yes
        set number
        set relativenumber
        set list
    endif
endfunction

function! JustifyMapping()
    for key in keys(g:justifyKeyMap)
        execute 'silent nnoremap <leader>j' . key . ' :Tabularize /' . g:justifyKeyMap[key] . '<CR>'
    endfor
endfunction

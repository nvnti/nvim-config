let g:_move_vim_types    = ['tag', 'qfx', 'diff', 'diagnostics', 'buffer', 'tab', 'dirdiff']
let g:_move_vim_type_ndx = 0

function! DefineMoveKeys()
    let c = 0
    while c <= len(g:_move_vim_types)
        execute 'nnoremap <silent> <Leader>' . string(c) . ' :call M_move_vim_change_type(' . string(c) . ')<CR>'
        let c += 1
    endwhile
endfunction

function! M_move_vim_current_type()
    return g:_move_vim_types[g:_move_vim_type_ndx]
endfunction

function! M_move_vim_change_type(type)
let g:_move_vim_type_ndx = a:type
execute "redraw!"
endfunction

function! M_move_vim_move_next()
    if g:_move_vim_type_ndx == 0
        execute "tn"
        execute "normal! zz"
    elseif g:_move_vim_type_ndx == 1
        execute "cn"
        execute "normal! zz"
    elseif g:_move_vim_type_ndx == 2
        execute "normal! ]c"
    elseif g:_move_vim_type_ndx == 3
        execute "lua vim.diagnostic.goto_next()"
    elseif g:_move_vim_type_ndx == 4
        execute "bn"
    elseif g:_move_vim_type_ndx == 5
        execute "tabnext"
    elseif g:_move_vim_type_ndx == 6
        DirDiffNext
    endif
endfunction

function! M_move_vim_move_prev()
    if g:_move_vim_type_ndx == 0
        execute "tp"
        execute "normal! zz"
    elseif g:_move_vim_type_ndx == 1
        execute "cp"
        execute "normal! zz"
    elseif g:_move_vim_type_ndx == 2
        execute "normal! [c"
    elseif g:_move_vim_type_ndx == 3
        execute "lua vim.diagnostic.goto_prev()"
    elseif g:_move_vim_type_ndx == 4
        execute "bp"
    elseif g:_move_vim_type_ndx == 5
        execute "tabprevious"
    elseif g:_move_vim_type_ndx == 6
        DirDiffPrev
    endif
endfunction

nnoremap <silent> <C-N> :call M_move_vim_move_next()<CR>
nnoremap <silent> <C-P> :call M_move_vim_move_prev()<CR>

call DefineMoveKeys()

let g:vimscript_location=expand("<sfile>:h")

" Beautify
vnoremap <silent><leader>bj    :'<,'>python3 beautifyJSON()<CR>
nnoremap <silent><leader>bj    :python3 beautifyJSONFile()<CR>
vnoremap <silent><leader>bx    :'<,'>!XMLLINT_INDENT="    " xmllint --format -<CR>
nnoremap <silent><leader>bx    :%!XMLLINT_INDENT="    " xmllint --format -<CR>

" DELETE / DIFF
nnoremap <silent><leader>dc :%!tr -cd '[:print:]\n'<CR>
nnoremap <silent><leader>dl :g//d<LEFT><LEFT>
nnoremap <silent><leader>dp :g/<C-R>=expand("<cword>")<CR>/d<CR>
nnoremap <silent><leader>ds :StripWhitespace<CR>
nnoremap <silent><leader>dw :call ToggleDiffWhitespace()<CR>

" paste / previos
" paste but retain
" replace the line with yanked line
nnoremap <silent><leader>pb :bp<CR>
nnoremap <silent><leader>pc :cp<CR>
nnoremap <silent><leader>pf ?{<CR>w99[{
nnoremap <silent><leader>pl V"0p
nnoremap <silent><leader>pt :tp<CR>
nnoremap <silent><leader>pw ciw<C-r>0<ESC>

" next
nnoremap <silent><leader>nb :bn<CR>
nnoremap <silent><leader>nc :cn<CR>
nnoremap <silent><leader>nf j0[[%/{<CR>
nnoremap <silent><leader>nt :tn<CR>

" reload
nnoremap <silent><leader>rd :diffupdate<CR>
nnoremap <silent><leader>rf :e %:p<CR>
nnoremap <silent><leader>rv :source ~/.vimrc<CR>

" See global vars
" nnoremap <silent><leader>ta :ToggleLocationList<CR>

" toggle highlight current line
nnoremap <silent><leader>th :set invcursorline<CR>
" toggle between source and header files
nnoremap <silent><leader>tf :call SwitchBetweenSourceHeader()<CR>
" line number
nnoremap <silent><leader>tl :set invnumber<CR>:set invrelativenumber<CR>
nnoremap <silent><leader>tp :set invpaste<CR>
" See global vars
nnoremap <silent><leader>tr :set list!<CR>


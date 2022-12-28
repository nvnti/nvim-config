" Diff
nmap <silent> <SPACE>Dn :EnhancedDiffIgnorePat \d\+<CR>
nmap <silent> <SPACE>dP :DirDiffPrev<CR>
nmap <silent> <SPACE>dG :%diffget<CR>
nmap <silent> <SPACE>dd :DirDiffUpdate<CR>
nmap <silent> <SPACE>dg :diffget<CR>
nmap <silent> <SPACE>dn :DirDiffNext<CR>
nmap <silent> <SPACE>dp :diffput<CR>
nmap <silent> <SPACE>dq :DirDiffQuit<CR>
nmap <silent> <SPACE>du :diffupdate<CR>
nmap <silent> <SPACE>dw :call ToggleDiffWhitespace()<CR>

vmap <silent> <SPACE>fc :ClangFormat<CR>
nmap <silent> <SPACE>fc :ClangFormat<CR>

" Toggle/tags
nnoremap <silent> <SPACE>t<SPACE> :call ToggleCopyMode()<CR>
nnoremap <silent> <SPACE>tc :call LoadTagsC()<CR>
nnoremap <silent> <SPACE>tr :call LoadTagsRust()<CR>

nnoremap <silent> <SPACE>yp :let @" = expand("%")<CR>

" Run clippy and collect errors
nnoremap <silent> <SPACE>rc :make clippy --target-dir=target-analyzer --workspace --all-targets --all-features --all -- -D clippy::perf -D clippy::all -D clippy::needless_lifetimes<CR>
" Format rust
nnoremap <silent> <SPACE>rf :RustFmt<CR>

" Cargo build
nnoremap <silent> <SPACE>rm :make build
" Cargo build workspace
nnoremap <silent> <SPACE>rw :make build --workspace<CR>

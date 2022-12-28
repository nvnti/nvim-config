command! -bang -nargs=* FZFRGrep
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs  '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* FZFRGrepCPP
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs -g {*.cpp,*.hpp,*.c,*.h,*.cxx,*.hxx,*.cc} '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* FZFRGrepJSON
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs -g {*.json} '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* FZFRGrepMakefile
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs -g {Makefile,*.mk} '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* FZFRGrepRegex
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs --regexp '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)


command! -bang -nargs=* FZFRGrepCPPRegex
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs -g {*.cpp,*.hpp,*.c,*.h,*.cxx,*.hxx,*.cc} --regexp '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* FZFRGrepJSONRegex
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs -g {*.json} --regexp '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* FZFRGrepMakefileRegex
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore-vcs -g {Makefile,*.mk} --regexp '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! FZFMru
      \ call fzf#run({
      \   'source':  py3eval('getRecentFiles()'),
      \   'sink':    'e',
      \   'options': '-m -x +s',
      \   'down':    '40%'})

if executable("rg")
    set grepprg=rg\ --column\ --line-number\ --ignore-case\ --no-ignore-vcs\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
else
    echoerr "Please install ripgrep!"
endif

" search
nnoremap <leader>fa :grep <C-R>=expand("<cword>")<CR>
nnoremap <leader>fc : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand("<cword>")<CR> analysis/
nnoremap <leader>fg : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}'
nnoremap <leader>fja : grep -g '{*.java}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fjs : grep -g '{*.json}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fm : grep -g '{*.mk,Makefile}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fp : grep -g '{*.py}' <C-R>=expand("<cword>")<CR> .
nnoremap <leader>fs : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand("<cword>")<CR> analysis/ <CR>
nnoremap <leader>fr : grep -g '{*.rs}' <C-R>=expand("<cword>")<CR> .
" nnoremap <leader>fr : GetRef <C-R>=expand("<cword>")<CR><CR>
nnoremap \fa        : grep --regexp <C-R>=expand("<cword>")<CR>
nnoremap \fc        : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' --regexp <C-R>=expand("<cword>")<CR> analysis/
nnoremap \fg        : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' --regexp
nnoremap \fja       : grep -g '{*.java}' --regexp <C-R>=expand("<cword>")<CR> $W/
nnoremap \fjs       : grep -g '{*.json}' --regexp <C-R>=expand("<cword>")<CR> $W/
nnoremap \fm        : grep -g '{*.mk,Makefile}' --regexp <C-R>=expand("<cword>")<CR> $W
nnoremap \fp        : grep -g '{*.py}' --regexp <C-R>=expand("<cword>")<CR> $W/
nnoremap \fp        : grep -g '{*.py}' --regexp <C-R>=expand("<cword>")<CR> $W/
nnoremap \fs        : grep -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' --regexp <C-R>=expand("<cword>")<CR> analysis/ <CR>

nnoremap <leader>Fa : grep -s <C-R>=expand("<cword>")<CR>
nnoremap <leader>Fc : grep -s -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand("<cword>")<CR> analysis/
nnoremap <leader>Fg : grep -s -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}'
nnoremap <leader>Fja : grep -s -g '{*.java}' <C-R>=expand("<cword>")<CR> $W/
nnoremap <leader>Fjs : grep -s -g '{*.json}' <C-R>=expand("<cword>")<CR> $W/
nnoremap <leader>Fp : grep -s -g '{*.py}' <C-R>=expand("<cword>")<CR> $W/
nnoremap <leader>Fm : grep -s -g '{*.mk,Makefile}' <C-R>=expand("<cword>")<CR> $W
nnoremap <leader>Fs : grep -s -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' <C-R>=expand("<cword>")<CR> analysis/ <CR>
nnoremap <leader>Fr : GetRef <C-R>=expand("<cword>")<CR><CR>
nnoremap \Fa        : grep --regexp <C-R>=expand("<cword>")<CR>
nnoremap \Fc        : grep -s -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' --regexp <C-R>=expand("<cword>")<CR> analysis/
nnoremap \Fg        : grep -s -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' --regexp
nnoremap \Fja       : grep -s -g '{*.json}' --regexp
nnoremap \Fjs       : grep -s -g '{*.json}' --regexp
nnoremap \Fp        : grep -s -g '{*.py}' --regexp
nnoremap \Fm        : grep -s -g '{*.mk,Makefile}' --regexp <C-R>=expand("<cword>")<CR> $W
nnoremap \Fs        : grep -s -g '{*.hpp,*.h,*.hxx,*.c,*.cpp,*.cxx,*.cc}' --regexp <C-R>=expand("<cword>")<CR> analysis/ <CR>

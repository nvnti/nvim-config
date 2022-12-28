set inccommand=split

set t_Co=256

" :execute 'set shadafile=' . g:CVAR_VIMFILES_DIR . '/shadafile'
" :execute "set shada='500,<5000,s100,n" . g:CVAR_VIMFILES_DIR . "/shada"

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


" Background colors for active vs inactive windows
hi ActiveWindow guibg=#17252c
hi InactiveWindow guibg=#0D1B22

" Background colors for terminal windows
hi ActiveTerminal guibg=#333333

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of terminal window
function! Handle_Win_Enter()
  " Change highlight group of active/inactive windows
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

  " Change highlight group of preview window when open
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif

  if &buftype ==# 'terminal'
    setlocal winhighlight=Normal:ActiveTerminal
  endif
endfunction

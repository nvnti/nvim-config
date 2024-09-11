local M = {}

function M.setup()
  require("functions.move").setup()

  if vim.fn.executable('rg') == 1 then
    vim.o.grepprg = 'rg --column --line-number --ignore-case --no-ignore-vcs --vimgrep --no-heading'
    vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
  else
    vim.cmd("Please install ripgrep!")
  end

  if not (vim.fn.executable('jq') == 1) then
    vim.cmd("Please install jq!")
  end

  if not (vim.fn.executable('yq') == 1) then
    vim.cmd("Please install yq!")
  end

  vim.opt.syntax = "enable"

  vim.cmd[[
    filetype plugin indent on
  ]]

  vim.cmd[[
    set inccommand=split

    set t_Co=256

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
  ]]
end

return M

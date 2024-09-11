-------------------
-- User commands --
-------------------
local api, fn = vim.api, vim.fn

local function yank_file_path(expr)
  fn.setreg('+', fn.expand(expr))
  vim.notify('Yanked file path: ' .. fn.getreg('+'))
end

api.nvim_create_user_command(
  'Search',
  ':let @/="\\\\V" . escape(<q-args>, "\\\\\") | normal! n',
  { nargs = 1, desc = 'Search literally, with no regex' }
)

api.nvim_create_user_command(
  'CDHere',
  'cd %:p:h',
  { desc = "Change working directory to current file's" }
)

api.nvim_create_user_command(
  'TCDHere',
  'tcd %:p:h',
  { desc = "Change tab page's working directory to current file's" }
)

api.nvim_create_user_command(
  'YankPath',
  function()
    yank_file_path('%')
  end,
  { desc = "Yank current file's path relative to cwd" }
)

api.nvim_create_user_command(
  'YankPathFull',
  function() yank_file_path('%:~') end,
  { desc = "Yank current file's absolute path" }
)

api.nvim_create_user_command(
  'Trash',
  function(command)
    local file = command.args and command.args ~= '' or '%'
    vim.cmd('silent !trash ' .. file)

    if file == '%' then
      vim.cmd.BufferClose()
      pcall(vim.cmd.wincmd, 'c')
    end
  end,
  {
    bar = true,
    bang = true,
    nargs = '?',
    complete = 'file',
    desc = 'Put current file in trashcan using trash-cli',
  }
)

api.nvim_create_user_command(
  'WhitespaceToggle',
  function()
    vim.o.list = not vim.o.list
  end,
  { desc = 'Toggle displaying of whitespace characters' }
)

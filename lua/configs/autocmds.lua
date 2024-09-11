---------------
-- Autocmds --
---------------
local o, opt, bo, wo, fn = vim.o, vim.opt, vim.bo, vim.wo, vim.fn
local utils = require('utils')
local map = utils.map

vim.api.nvim_create_augroup('GeneralAutocmds', {})
vim.api.nvim_create_augroup('FileTypeAutocmds', {})

-- TypeScript specific --
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typescript',
  callback = function()
    opt.matchpairs:append('<:>')
  end,
  group = 'FileTypeAutocmds',
})

-- Disabled until TSLspOrganize and/or TSLspImportAll doesn't collide with
--     ['*.ts,*.tsx'] = function()
--       if b.format_on_write ~= false then
--         vim.cmd 'TSLspOrganize'
--         vim.cmd 'TSLspImportAll'
--       end
--     end
--   }
-- }

-- Check if any file has changed when Neovim is focused
vim.api.nvim_create_autocmd('FocusGained', {
  command = 'checktime',
  group = 'GeneralAutocmds'
})

-- Custom filetypes
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*.dconf',
  callback = function() o.syntax = 'sh' end,
  group = 'FileTypeAutocmds',
})

-- Open :help in vertical split instead of horizontal
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function()
    bo.bufhidden = 'unload'
    vim.cmd.wincmd('L')
    vim.cmd 'vertical resize 81'
  end,
  group = 'FileTypeAutocmds',
})

-- Don't conceal current line in some file formats
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'latex', 'tex', 'json', 'http' },
  callback = function() wo.concealcursor = '' end,
  group = 'FileTypeAutocmds',
})

-- Markdown specific --
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    -- Adds horizontal line below and enters insert mode below it
    map('n', '<leader>-', 'o<Esc>0"_Do<Esc>0"_C---<CR><CR>')
  end,
  group = 'FileTypeAutocmds',
})

-- Filetype specific indent settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'css', 'python', 'cs' },
  callback = function() bo.shiftwidth = 4 end,
  group = 'FileTypeAutocmds',
})

-- Start git commits at start of line, and insert mode if message is empty
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = function()
    wo.spell = true
    if fn.getline(1) == '' then
      vim.cmd('startinsert!')
    end
  end,
  group = 'FileTypeAutocmds',
})

-- `K` in Lua files opens Vim helpdocs
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function() bo.keywordprg = ':help' end,
  group = 'FileTypeAutocmds',
})

vim.api.nvim_create_autocmd(
  {
    "BufEnter",
  },
  {
    pattern = "*.vim",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "vim")
    end
  }
)

vim.api.nvim_create_autocmd(
  {
    "BufEnter",
  },
  {
    pattern = "*.jinja",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "html")
    end
  }
)

vim.api.nvim_create_autocmd(
  {
    "BufRead",
    "BufNewFile",
  },
  {
    pattern = "*.hpp,*.cpp",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "tabstop", 4)
      vim.api.nvim_buf_set_option(buf, "shiftwidth", 4)
      vim.api.nvim_buf_set_option(buf, "softtabstop", 4)
    end
  }
)

vim.api.nvim_create_autocmd(
  {
    "FileType",
  },
  {
    pattern = "tagbar,nerdtree,NvimTree",
    callback = function()
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_option(win, "signcolumn", "no")
    end
  }
)

vim.api.nvim_create_autocmd(
  {
    "SwapExists",
  },
  {
    pattern = "*",
    callback = function()
      vim.v.swapchoice = "o"
    end
  }
)

vim.api.nvim_create_autocmd(
  {
    "WinEnter",
  },
  {
    pattern = "*",
    callback = function()
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_option(win, "winhighlight", "Normal:ActiveWindow,NormalNC:InactiveWindow")

      if vim.opt.previewwindow then
        vim.api.nvim_win_set_option(win, "winhighlight", "Normal:MarkdownError")
      end

      if vim.opt.buftype == 'terminal' then
        vim.api.nvim_win_set_option(win, "winhighlight", "Normal:ActiveTerminal")
      end
    end
  }
)

vim.api.nvim_create_autocmd(
  {
    "BufWritePre",
  },
  {
    pattern = "*",
    callback = function()
      local path = vim.fn.stdpath("data") .. "/snapshots"
      local bpath = path .. "/backup"
      local spath = path .. "/swap"
      local upath = path .. "/undo"

      os.execute('mkdir -p ' .. bpath)
      os.execute('mkdir -p ' .. spath)
      os.execute('mkdir -p ' .. upath)

      vim.opt.undodir = upath
      vim.opt.undofile = true

      vim.opt.swapfile = true
      vim.opt.directory = spath

      vim.opt.backup = true
      vim.opt.backupdir = bpath

      local fname = vim.fn.substitute(vim.fn.expand('%:p:h'), '/', '%', 'g')

      local curMinute   = (vim.fn.localtime() / 60) % 60

      local timestamp = vim.fn.strftime("%y_%m_%d_%H_") .. tostring((curMinute + 10) - (curMinute % 10))

      vim.opt.backupext = '_' .. fname .. '_' .. timestamp
    end
  }
)

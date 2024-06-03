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

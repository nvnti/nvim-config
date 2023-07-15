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

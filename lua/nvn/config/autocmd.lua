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
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "signcolumn", "no")
    end
  }
)

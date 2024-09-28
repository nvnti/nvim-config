vim.api.nvim_create_autocmd(
  {
    "BufEnter",
  },
  {
    pattern = "*.vim",
    callback = function()
      vim.api.nvim_set_option_value("filetype", "vim", { buf = vim.api.nvim_get_current_buf() })
    end,
  }
)

vim.api.nvim_create_autocmd(
  {
    "BufEnter",
  },
  {
    pattern = "*.jinja",
    callback = function()
      vim.api.nvim_set_option_value("filetype", "html", { buf = vim.api.nvim_get_current_buf() })
    end,
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
      local bufnr = vim.api.nvim_get_current_buf()

      vim.api.nvim_set_option_value("tabstop", 4, { buf = bufnr })
      vim.api.nvim_set_option_value("shiftwidth", 4, { buf = bufnr })
      vim.api.nvim_set_option_value("softtabstop", 4, { buf = bufnr })
    end,
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
      vim.api.nvim_set_option_value("signcolumn", "no", { win = win })
    end,
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
    end,
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
      vim.api.nvim_set_option_value("winhighlight", "Normal:ActiveWindow,NormalNC:InactiveWindow",
        { win = win })

      if vim.opt.previewwindow then
        vim.api.nvim_set_option_value("winhighlight", "Normal:MarkdownError", { win = win })
      end

      if vim.opt.buftype == 'terminal' then
        vim.api.nvim_set_option_value("winhighlight", "Normal:ActiveTerminal", { win = win })
      end
    end,
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

      vim.opt.undodir   = upath
      vim.opt.undofile  = true

      vim.opt.swapfile  = true
      vim.opt.directory = spath

      vim.opt.backup    = true
      vim.opt.backupdir = bpath

      local fname       = vim.fn.substitute(vim.fn.expand('%:p:h'), '/', '%', 'g')

      local curMinute   = (vim.fn.localtime() / 60) % 60

      local timestamp   = vim.fn.strftime("%y_%m_%d_%H_") ..
          tostring((curMinute + 10) - (curMinute % 10))

      vim.opt.backupext = '_' .. fname .. '_' .. timestamp
    end,
  }
)

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    -- File types to not format on write
    local format_on_write_blacklist = {
      "c",
      "cpp",
    }

    local bufnr = args.buf
    local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not vim.opt.diff:get() then
      require("lsp-inlayhints").on_attach(client, bufnr)
    end

    -- Autoformatting
    if not vim.tbl_contains(format_on_write_blacklist, filetype) then
      require('utils.formatting').format_on_write(client, bufnr)
    end
  end,
})

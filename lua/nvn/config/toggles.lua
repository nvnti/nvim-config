local M = {}

function M.toggle_rust_fmt()
  if (vim.g.rustfmt_autosave == 1)
  then
    vim.g.rustfmt_autosave = 0
  else
    vim.g.rustfmt_autosave = 1
  end
end

function M.toggle_diff_whitespace()
  if string.find(vim.o.diffopt, "iwhite")
  then
    vim.o.diffopt = "internal,filler,closeoff,hiddenoff,algorithm:patience"
  else
    vim.o.diffopt = "internal,filler,closeoff,hiddenoff,algorithm:patience,iwhite"
  end
end

function M.toggle_text_width_line()
  if vim.o.textwidth == 85
  then
    vim.o.textwidth = 120
    vim.o.colorcolumn = 120
  elseif vim.o.textwidth == 120
  then
    vim.o.textwidth = 0
    vim.o.colorcolumn = 0
  else
    vim.o.textwidth = 85
    vim.o.colorcolumn = 85
  end
end

function M.toggle_tab_width()
  if vim.opt.tabstop == 2 then
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  else
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
end

function M.toggle_copy_mode()
  if vim.opt.number or vim.opt.relativenumber or vim.opt.list then
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.signcolumn = "no"
    vim.opt.list = false
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = "yes"
    vim.opt.list = true
  end
end

return M

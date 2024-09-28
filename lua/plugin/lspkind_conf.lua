----------------------------
--
-------------------------------
return {
  "onsails/lspkind.nvim",
  enabled = function()
    return not vim.opt.diff:get()
  end,
}

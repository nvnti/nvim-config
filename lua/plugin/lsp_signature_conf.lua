----------------------------
--
-------------------------------
return {
  "ray-x/lsp_signature.nvim",
  enabled = function()
    return not vim.opt.diff:get()
  end,
}

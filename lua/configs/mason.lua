-----------
-- Mason --
-----------
return {
  'williamboman/mason.nvim',
  dependencies = 'williamboman/mason-lspconfig.nvim',
  event = 'VeryLazy',
  opts = {},
  enabled = function()
    return not vim.opt.diff:get()
  end,
}

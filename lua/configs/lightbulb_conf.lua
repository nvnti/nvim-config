return {
  'kosayoda/nvim-lightbulb',
  dependencies = "antoinemadec/FixCursorHold.nvim",
  enabled = function()
    return not vim.opt.diff:get()
  end,
  config = function()
  end,
}

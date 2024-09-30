---------
-- Bqf --
---------
---@diagnostic disable: missing-fields
return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = { 'junegunn/fzf', build = "./install --bin" },
  enabled = function()
    return false
    --return not vim.opt.diff:get()
  end,
  config = function()
    require('../quickfix') -- Better quickfix
    require('bqf').setup {
      preview = {
        auto_preview = false,
      },
      func_map = {
        fzffilter = '/',
        split     = '<C-s>',
      },
      filter = { -- Adapt fzf's delimiter in nvim-bqf
        fzf = {
          extra_opts = { '--bind', 'alt-a:toggle-all', '--delimiter', '│' },
        },
      },
    }
  end,
}

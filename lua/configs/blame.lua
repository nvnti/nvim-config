-----------
-- Blame --
-----------
return {
  'FabijanZulj/blame.nvim',
  cmd = 'BlameToggle',
  enabled = function()
    return not vim.opt.diff:get()
  end,
  -- In mappings/space file.
  -- keys = {
  --   { '<leader>gb', '<cmd>BlameToggle<CR>', desc = 'Git blame file' },
  -- },
  opts = {
    mappings = {
      commit_info = '<space>',
    },
  },
}

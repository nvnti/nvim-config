-----------
-- Blame --
-----------
return {
  'FabijanZulj/blame.nvim',
  cmd = 'BlameToggle',
  -- In mappings/space file.
  -- keys = {
  --   { '<leader>gb', '<cmd>BlameToggle<CR>', desc = 'Git blame file' },
  -- },
  opts = {
    mappings = {
      commit_info = '<space>',
    },
  }
}

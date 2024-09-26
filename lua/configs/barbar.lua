------------
-- Barbar --
------------
local map = require('utils').map

return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  enabled = function()
    return not vim.opt.diff:get()
  end,
  config = function()
    require('barbar').setup({
      no_name_title = '[No Name]',
      insert_at_end = true,
      exclude_name = { '[dap-repl]' },
      exclude_ft = { 'qf' },
      maximum_length = 60,
      hide = { extensions = true },
      icons = {
        button = false,
        buffer_number = true,
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
        separator = { left = '▎', right = '' },

        -- If true, add an additional separator at the end of the buffer list
        separator_at_end = true,
      },
    })

    map('n', '<Space>bC', '<cmd>BufferClose<CR><cmd>wincmd c<CR>')
    map('n', '<Space>qq', '<cmd>BufferClose!<CR>')
    -- Buffer-picking mode
    map('n', '<Space>bP', '<cmd>BufferPick<CR>')
    map('n', '<Space>bd', '<cmd>BufferPickDelete<CR>')
    -- Sort automatically by...
    map('n', '<Space>bD', '<cmd>BufferOrderByDirectory<CR>')
    map('n', '<Space>bl', '<cmd>BufferOrderByLanguage<CR>')
    map('n', '<Space>bc', '<cmd>BufferClose<CR>')
    map('n', '<Space>br', '<cmd>BufferRestore<CR>')
    map('n', '<Space>bqv', '<cmd>BufferCloseAllButVisible<CR>')
    -- Re-order to previous/next
    map('n', '<Space>bn', '<cmd>BufferMoveNext<CR>')
    map('n', '<Space>bp', '<cmd>BufferMovePrevious<CR>')
    -- Goto buffer in position...
    map('n', '<Space>1', '<cmd>BufferGoto 1<CR>')
    map('n', '<Space>2', '<cmd>BufferGoto 2<CR>')
    map('n', '<Space>3', '<cmd>BufferGoto 3<CR>')
    map('n', '<Space>4', '<cmd>BufferGoto 4<CR>')
    map('n', '<Space>5', '<cmd>BufferGoto 5<CR>')
    map('n', '<Space>6', '<cmd>BufferGoto 6<CR>')
    map('n', '<Space>7', '<cmd>BufferGoto 7<CR>')
    map('n', '<Space>8', '<cmd>BufferGoto 8<CR>')
    map('n', '<Space>9', '<cmd>BufferLast<CR>')
  end,
}
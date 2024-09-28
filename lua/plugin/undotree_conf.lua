----------------------------
--
-------------------------------
return {
  "mbbill/undotree",
  keys = '\\u',
  cmd = { 'UndoTreeShow', 'UndoTreeToggle' },
  config = function()
    vim.keymap.set("n", "\\u", vim.cmd.UndotreeToggle)
    local map = require('utils').map

    map('n', '<leader>u', function()
      vim.cmd 'UndotreeShow'
      vim.cmd 'UndotreeFocus'
    end, 'Open undo tree')

    vim.api.nvim_create_augroup('UndoTreeMaps', {})
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'undotree',
      callback = function()
        local opts = { buffer = true, nowait = true }
        map('n', '<Space>uo', '<Plug>UndotreeEnter', opts)
        map('n', '<Space>un', '<plug>UndotreeNextState', opts)
        map('n', '<Space>up', '<plug>UndotreePreviousState', opts)
      end,
      group = 'UndoTreeMaps',
    })
  end,
}

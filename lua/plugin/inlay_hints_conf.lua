----------------------------
--
-------------------------------
return {
  'lvimuser/lsp-inlayhints.nvim',
  branch = 'anticonceal',
  event = 'LspAttach',
  enabled = function()
    return not vim.opt.diff:get()
  end,
  opts = require('lsplocalconfig.pluginconf.lspinlayhints'),
}

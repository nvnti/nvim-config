---------------------------
-- Completion configuration
---------------------------

return {
  'nvimtools/none-ls.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  event = 'VeryLazy',
  config = function()
    local b = vim.b
    local map = require('utils').map
    local null_ls, builtins = require('null-ls'), require('null-ls').builtins

    local sources = {
      builtins.formatting.prettier,
      builtins.hover.dictionary,
      builtins.formatting.shfmt.with({
        args = { '-sr' }, -- Space after redirects
      }),
    }

    null_ls.setup({
      sources = sources,
      on_attach = function(client, bufnr)
        require('utils.formatting').format_on_write(client, bufnr)
      end,
      should_attach = require("config.formatter").should_format_files,
    })

    map('n', '<F2>', function()
      b.format_on_write = (not b.format_on_write and b.format_on_write ~= nil)
      vim.notify(
        'Format on write '
        .. (b.format_on_write and 'enabled' or 'disabled')
      )
    end, 'Toggle autoformatting on write')
  end,
}

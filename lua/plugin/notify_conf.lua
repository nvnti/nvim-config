----------------------------
--
-------------------------------
return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require('notify')

    ---@diagnostic disable-next-line: missing-fields
    notify.setup({
      timeout = 20000,
      background_colour = "#000000",
    })

    vim.notify = notify

    -- LSP window/showMessage
    vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local level = ({ 'ERROR', 'WARN', 'INFO', 'DEBUG' })[result.type]

      notify({ result.message }, level, {
        title = 'LSP | ' .. (client and client.name or '?'),
        timeout = 10000,
        keep = function() return level == 'ERROR' or level == 'WARN' end,
      })
    end
  end,
}

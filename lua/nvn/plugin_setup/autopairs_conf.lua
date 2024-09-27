local M = {}

function M.fn()
  require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
  })
end

return M

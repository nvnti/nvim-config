local M = {}

function M.fn()
  vim.keymap.set("n", "\\u", vim.cmd.UndotreeToggle)
end

return M

local M = {}

function M.fn()
  require("lazygit").setup({
    require("telescope").load_extension("lazygit")
  })
end

return M


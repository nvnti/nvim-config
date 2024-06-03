local M = {}

function M.fn()
  require'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
    }
  }
end

return M

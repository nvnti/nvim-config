local M = {}

function M.fn()
  vim.g.DirDiffExcludes = "*.pyc,__pycache__,*.o"
  vim.g.DirDiffSilentExit = 1
end

return M

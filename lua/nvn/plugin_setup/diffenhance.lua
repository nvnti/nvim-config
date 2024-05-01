local M = {}

function M.fn()
  vim.cmd([[
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
  ]])
end

return M

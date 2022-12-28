vim.cmd([[
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
]])

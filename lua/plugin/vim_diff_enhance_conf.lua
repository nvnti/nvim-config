----------------------------
--
-------------------------------
return {
  "chrisbra/vim-diff-enhanced",
  config = function()
    vim.cmd([[
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
  ]])
  end,
}

----------------------------
--
-------------------------------
return {
  "mhinz/vim-startify",
  config = function()
    vim.g.startify_change_to_dir = 0
    vim.g.startify_change_to_vcs_root = 0
  end,
}

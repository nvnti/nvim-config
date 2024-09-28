----------------------------
--
-------------------------------
return {
  "naveentiwari/vim-dirdiff",
  config = function()
    vim.g.DirDiffExcludes = "*.pyc,__pycache__,*.o"
    vim.g.DirDiffSilentExit = 1
  end,
}

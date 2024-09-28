----------------------------
--
-------------------------------
return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
  },
  build = function()
    vim.cmd("call fzf#install()")
  end,
}

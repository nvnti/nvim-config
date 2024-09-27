local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.api.nvim_win_get_option(0, "diff") then
  local lazy_conf = require("nvn.lazy_plugin.lazy_conf")
  local lazy_plugin = require("nvn.lazy_plugin.lazy_plugin")
  require("lazy").setup(lazy_plugin, lazy_conf)
else
  local lazy_conf = require("nvn.lazy_plugin.lazy_conf")
  local lazy_plugin = require("nvn.lazy_plugin.lazy_plugin")
  require("lazy").setup(lazy_plugin, lazy_conf)
end

local function GetPluginDirectory()
  if vim.opt.diff:get() then
    return "/diff_mode"
  else
    return "/coding_mode"
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.notify('Installing lazy.nvim...')
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

-- local lazy_conf = require("lazy_plugin.lazy_conf")
-- local lazy_plugin = require("lazy_plugin.lazy_plugin")
-- require("lazy").setup(lazy_plugin, lazy_conf)

require("lazy").setup({
  spec        = require('plugin'),
  root        = vim.fn.stdpath("data") .. GetPluginDirectory(),
  lockfile    = vim.fn.stdpath("data") .. GetPluginDirectory() .. ".json",
  readme_root = vim.fn.stdpath("state") .. GetPluginDirectory() .. "/lazy/readme",
  state       = vim.fn.stdpath("state") .. GetPluginDirectory() .. "/lazy/state.json",
  install     = {
    colorscheme = { 'onedark' },
  },
  performance = {
    rtp = {
      disabled_plugins = { 'netrwPlugin', 'tutor' },
    },
  },
})

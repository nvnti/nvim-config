local M = {}

function M.GetPluginDirectory()
  if vim.api.nvim_win_get_option(0, "diff") then
    return "/diff_mode"
  else
    return "/coding_mode"
  end
end

M.plugin_root = vim.fn.stdpath("data") .. M.GetPluginDirectory()
M.lockfile  = vim.fn.stdpath("data") .. M.GetPluginDirectory() .. ".json"
M.readme_root = vim.fn.stdpath("state") .. M.GetPluginDirectory() ..  "/lazy/readme"
M.state = vim.fn.stdpath("state") .. M.GetPluginDirectory() .. "/lazy/state.json"

return M


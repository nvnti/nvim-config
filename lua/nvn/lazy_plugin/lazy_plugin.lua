if vim.api.nvim_win_get_option(0, "diff") then
  local all_plugins = require("nvn.lazy_plugin.all_plugin")
  local return_plugins = {}

  for i = 1, #all_plugins do
    if all_plugins[i].info.type ~= "coding" then
      return_plugins[#return_plugins + 1] = all_plugins[i].settings
    end
  end
  return return_plugins
else
  local all_plugins = require("nvn.lazy_plugin.all_plugin")
  local return_plugins = {}

  for i = 1, #all_plugins do
    return_plugins[#return_plugins + 1] = all_plugins[i].settings
  end
  return return_plugins
end

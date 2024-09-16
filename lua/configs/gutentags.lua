----------------
-- Generate rust tags
----------------
return {
  "ludovicchabant/vim-gutentags",
  -- cond = vim.fn.executable("ctags") == 1,
  opts = {},
  config = function()
    if vim.g.gutentags_project_info == nil then
      vim.g.gutentags_project_info = {}
      vim.g.gutentags_project_info["type"] = "rust"
      vim.g.gutentags_project_info["file"] = "Cargo.toml"
    end

    vim.g.gutentags_project_info["type"] = "rust"
    vim.g.gutentags_project_info["file"] = "Cargo.toml"

    -- vim.fn.add(vim.g.gutentags_project_info, project_info)
    vim.g.gutentags_ctags_executable_rust = '~/.myconfig/scripts/configurations/rusttags.sh'
  end,
}

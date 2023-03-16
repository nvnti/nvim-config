local M = {}

function M.toggle_rust_fmt()
  if(vim.g.rustfmt_autosave == 1)
  then
    vim.g.rustfmt_autosave = 0
  else
    vim.g.rustfmt_autosave = 1
  end
end

return M

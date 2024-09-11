local M = {}
local actions = require("diffview.actions")

function M.setup()
  vim.g.move_type_ndx = 0

  vim.keymap.set("n", "<leader>0", function()
    vim.g.move_type_ndx = 0
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>1", function()
    vim.g.move_type_ndx = 1
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>2", function()
    vim.g.move_type_ndx = 2
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>3", function()
    vim.g.move_type_ndx = 3
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>4", function()
    vim.g.move_type_ndx = 4
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>5", function()
    vim.g.move_type_ndx = 5
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>6", function()
    vim.g.move_type_ndx = 6
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>7", function()
    vim.g.move_type_ndx = 7
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>8", function()
    vim.g.move_type_ndx = 8
    vim.api.nvim_exec("redraw!", false)
  end)
  vim.keymap.set("n", "<leader>9", function()
    vim.g.move_type_ndx = 9
    vim.api.nvim_exec("redraw!", false)
  end)
end

function M.current_type()
    if     vim.g.move_type_ndx == 0 then return "tag"
    elseif vim.g.move_type_ndx == 1 then return "qfx"
    elseif vim.g.move_type_ndx == 2 then return "diff"
    elseif vim.g.move_type_ndx == 3 then return "gdiff"
    elseif vim.g.move_type_ndx == 4 then return "buffer"
    elseif vim.g.move_type_ndx == 5 then return "tab"
    elseif vim.g.move_type_ndx == 6 then return "dirdiff"
    elseif vim.g.move_type_ndx == 7 then return "diagnostics"
    elseif vim.g.move_type_ndx == 8 then return "---"
    elseif vim.g.move_type_ndx == 9 then return "---"
    else                                 return "---"
  end
end

function M.next()
    if     vim.g.move_type_ndx == 0 then
      vim.api.nvim_exec("tn", false)
      vim.api.nvim_exec("normal!zz", false)
    elseif vim.g.move_type_ndx == 1 then
      vim.api.nvim_exec("cn", false)
      vim.api.nvim_exec("normal!zz", false)
    elseif vim.g.move_type_ndx == 2 then
      vim.api.nvim_exec("normal! ]c", false)
    elseif vim.g.move_type_ndx == 3 then
      actions.select_next_entry()
    elseif vim.g.move_type_ndx == 4 then
      vim.api.nvim_exec("bn", false)
    elseif vim.g.move_type_ndx == 5 then
      vim.api.nvim_exec("tabnext", false)
    elseif vim.g.move_type_ndx == 6 then
      vim.api.nvim_exec("DirDiffNext", false)
    elseif vim.g.move_type_ndx == 7 then
      vim.api.nvim_exec("lua vim.diagnostic.goto_next()", false)
    elseif vim.g.move_type_ndx == 8 then
    elseif vim.g.move_type_ndx == 9 then
    else
  end
end

function M.prev()
    if     vim.g.move_type_ndx == 0 then
      vim.api.nvim_exec("tp", false)
      vim.api.nvim_exec("normal!zz", false)
    elseif vim.g.move_type_ndx == 1 then
      vim.api.nvim_exec("cp", false)
      vim.api.nvim_exec("normal!zz", false)
    elseif vim.g.move_type_ndx == 2 then
      vim.api.nvim_exec("normal! [c", false)
    elseif vim.g.move_type_ndx == 3 then
      actions.select_prev_entry()
    elseif vim.g.move_type_ndx == 4 then
      vim.api.nvim_exec("bp", false)
    elseif vim.g.move_type_ndx == 5 then
      vim.api.nvim_exec("tabprevious", false)
    elseif vim.g.move_type_ndx == 6 then
      vim.api.nvim_exec("DirDiffPrev", false)
    elseif vim.g.move_type_ndx == 7 then
      vim.api.nvim_exec("lua vim.diagnostic.goto_prev()", false)
    elseif vim.g.move_type_ndx == 8 then
    elseif vim.g.move_type_ndx == 9 then
    else
  end
end

return M

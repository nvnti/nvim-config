local builtin = require('telescope.builtin')

local M = {}

function M.grep_word_in_rust()
  builtin.grep_string {
    find_command = { "rg", "--files", "--type", "rust" },
    search = vim.fn.input "Grep String > ",
    cwd = vim.fn.input("Path: ", "", "file"),
  }
end

function M.grep_word_under_cursor_in_rust()
  builtin.grep_string {
    find_command = { "rg", "--files", "--type", "rust" },
    cwd = vim.fn.input("Path: ", "", "file"),
  }
end

function M.grep_word_in_selected_type()
  builtin.grep_string {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "Type: ",
    },
    search = vim.fn.input "Grep String > ",
    cwd = vim.fn.input("Path: ", "", "file"),
  }
end

function M.grep_word_under_cursor_in_selected_type()
  builtin.grep_string {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "type: ",
    },
    cwd = vim.fn.input("Path: ", "", "file"),
  }
end

function M.grep_word_in_all_files()
  builtin.grep_string {
    search = vim.fn.input "Grep String > ",
    cwd = vim.fn.input("Path: ", "", "file"),
  }
end

function M.live_grep_in_selected_files()
  builtin.live_grep {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "type: ",
    },
    cwd = vim.fn.input("Path: ", "", "file"),
  }
end

return M

local M = {}

M.format_file_types = {
  "lua",
  "rust",
}

function M.should_format_files(bufnr)
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })

  return vim.tbl_contains(M.format_file_types, filetype)
end

function M.toggle_file_type_format()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })

  if vim.tbl_contains(M.format_file_types, filetype) then
    for i, v in pairs(M.format_file_types) do
      if v == filetype then
        table.remove(M.format_file_types, i)
        break
      end
    end
  else
    table.insert(M.format_file_types, filetype)
  end
end

function M.show_formatted_files()
  for i, v in pairs(M.format_file_types) do
    print(v)
  end
end

return M

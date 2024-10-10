local M = {}

function M.toggle_filetype_formatter()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
  local temp = vim.g.toggle_dict

  temp.global_toggleable.formatter[filetype] = not
      temp.global_toggleable.formatter[filetype]

  vim.g.toggle_dict = temp
end

function M.toggle_buffer_formatter()
  -- local bufnr = vim.api.nvim_get_current_buf()
  local bufnr = tostring(vim.fn.bufnr())
  local temp = vim.g.toggle_dict

  temp.buffer_toggleable.formatter[bufnr] = not
      temp.buffer_toggleable.formatter[bufnr]

  vim.g.toggle_dict = temp
end

function M.is_filetype_formatter_enabled(filetype)
  local temp = vim.g.toggle_dict

  if temp.global_toggleable.formatter[filetype] == nil then
    return temp.global_toggleable.formatter["all"]
  else
    return temp.global_toggleable.formatter[filetype]
  end
end

function M.is_buffer_formatter_enabled(bufnr)
  local temp = vim.g.toggle_dict
  local num = tostring(bufnr)

  if temp.buffer_toggleable.formatter[num] == nil then
    return true
  else
    return temp.buffer_toggleable.formatter[num]
  end
end

function M.is_formatter_enabled(bufnr, filetype)
  return M.is_filetype_formatter_enabled(filetype) and M.is_buffer_formatter_enabled(bufnr)
end

function M.show_content()
  vim.cmd [[
    echo g:toggle_dict
  ]]
end

function M.setup()
  vim.g.toggle_dict = {
    global_toggleable = {
      formatter = {
        all = true,
        c = false,
        cpp = false,
      },
    },
    buffer_toggleable = {
      formatter = {},
    },
  }
end

return M

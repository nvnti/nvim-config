local M = {}

function M.format_json()
  vim.cmd[[
python << EOF
import vim
import json
try:
    buf = vim.current.buffer
    json_content = '\n'.join(buf[:])
    content = json.loads(json_content)
    sorted_content = json.dumps(content, indent=2, sort_keys=True)
    buf[:] = sorted_content.split('\n')
except Exception as e:
    print(e)
EOF
  ]]
end

function M.format_file_normal_mode()
    local type_ = vim.bo.filetype
    local fname = vim.fn.expand('%')

    -- rust file
    if type_ == "rust" then
      vim.api.nvim_command(":!rustfmt +nightly " .. fname)

    -- C/CPP file
    elseif type_ == "cpp" or type_ == "c" then

      vim.api.nvim_command(":ClangFormat")

    -- Format JSON file
    elseif type_ == "json" then
  vim.cmd[[
python << EOF
import vim
import json
try:
    buf = vim.current.buffer
    json_content = '\n'.join(buf[:])
    content = json.loads(json_content)
    sorted_content = json.dumps(content, indent=2, sort_keys=True)
    buf[:] = sorted_content.split('\n')
except Exception as e:
    print(e)
EOF
  ]]

    elseif type_ == "xml" then
        vim.api.nvim_command(":%!XMLLINT_INDENT=\"    \" xmllint --format -")

    -- Else just justify the file
    else
        vim.api.nvim_command("gg=G")
    end

end

function M.format_file_visual_mode()
    local type_ = vim.bo.filetype
    local fname = vim.fn.expand('%')

    -- C/CPP file
    if type_ == "cpp" or type_ == "c" then

      vim.api.nvim_command(":ClangFormat")

    elseif type_ == "xml" then
        vim.api.nvim_command(":'<,'>!XMLLINT_INDENT=\"    \" xmllint --format -")

    -- Else just justify the file
    else
        vim.api.nvim_command("=")
    end

end

return M

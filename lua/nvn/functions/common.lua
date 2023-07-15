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

return M

local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = "close",
      },
      n = {
        ["<space>ca"] = actions.send_to_qflist,
      },
    },
  },
  pickers = {
    -- ...
  },
  extensions = {
    -- ...
  }
}

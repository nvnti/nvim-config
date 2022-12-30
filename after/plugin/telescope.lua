local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    theme = "dropdown",
    mappings = {
      -- i = {
      --   ["<ESC>"] = "close",
      -- },
      n = {
        ["<space>ca"] = actions.send_to_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
  extensions = {
    -- ...
  }
}

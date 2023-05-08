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
    find_files = {
      find_command = {
        'fd',
        '--type',
        'f',
        '--no-ignore-vcs',
        '--color=never',
        '--hidden',
        '--follow',
      }
    }
  },
  extensions = {
    -- ...
  },
  vimgrep_arguments = {
    'rg',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case',
    '-u' -- thats the new thing
  }
}

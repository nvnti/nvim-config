local M = {}

function M.fn()
  require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all"

    ensure_installed = {
      "c",
      "vimdoc",
      "javascript",
      "javascript",
      "lua",
      "python",
      "rust",
      "typescript"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    auto_install = true,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },

    indent = {
      enable = true
    }
  }
end

return M

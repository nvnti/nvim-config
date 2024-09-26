vim.g.mapleader = ","

local use = require('utils').use

-- General configs
require('configs.autocmds')
require('configs.commands')
require('configs.neovide')
require('configs.options')

-- Lazy
require('utils.lazy')


local plugins = {
  'folke/lazy.nvim', -- Package manager

  -- use 'lualine',              -- Lualine
  use 'action-preview',       -- Action preview
  use 'ai',                   -- next/previous text objects
  use 'alpha',                -- Nicer start screen
  use 'autolist',             -- Autocomplete lists
  use 'barbar',               -- Sexiest buffer tabline
  use 'barbecue',             -- Treesitter breadcrumbs
  use 'blame',                -- Git blame file
  use 'bqf',                  -- Better quickfix
  use 'capslock',             -- Virtual CapsLock
  use 'catppuccin',           -- Colorscheme
  use 'cheat',                -- cheat.sh
  use 'cmp',                  -- Autocompletion
  use 'cmp-lsp-rs',           -- Better Rust sorting
  use 'csv',                  -- CSV highlighting, etc.
  use 'dap',                  -- Debugger
  use 'dap-ui',               -- UI for nvim-dap
  use 'demicolon',            -- Overloaded `;`/`,` keys
  use 'diffenhance',          -- Diff algorithm
  use 'diffview',             -- Diff view
  use 'dirdiff',              -- Directory diff
  use 'dressing',             -- Improves `vim.ui` interfaces
  use 'easy-align',           -- Align characters vertically
  use 'editorconfig',         -- Editor config
  use 'eunuch',               -- :Rename, :Delete, etc. file
  use 'eyeliner',             -- Highlight uniques on f/F/t/T
  use 'fastaction',           -- Predictable LSP code actions
  use 'feline',               -- Statusline framework
  use 'fidget',               -- LSP progress indicator
  use 'fmtclangconf',         -- Formatters for all
  use 'fmtrustconf',          -- Formatters for all
  use 'fzf',                  -- Fuzzy finder
  use 'githublink',           -- Git repo link
  use 'gitsigns',             -- Git status in sign column
  use 'goto_preview',         -- Goto preview
  use 'guess-indent',         -- Guess file's indent level
  use 'gx',                   -- Improved link opening with gx
  use 'helpview',             -- Improved Helpdocs rendering
  use 'highlight_yank',       -- High light yank
  use 'highlighturl',         -- Highlight URLs
  use 'hlsearch',             -- Auto remove search highlights
  use 'icon-picker',          -- Emoji, Nerd Font icons, etc.
  use 'image',                -- ASCII art image viewer
  use 'indent-blankline',     -- Indent markers
  use 'lastplace',            -- Restore cursor position
  use 'lazy_git',             -- Lazy Git
  use 'lazydev',              -- Neovim-aware lua-ls config
  use 'lightbulb_conf',       -- Light bulb
  use 'litee_conf',           -- Litee
  use 'lsp',                  -- Language server
  use 'lsp-inlay-hints',      -- LSP inlay hints
  use 'ltex',                 -- LTeX utils
  use 'luafmtconf',           -- Lualine
  use 'luasnip',              -- Snippet engine
  use 'markdown-togglecheck', -- Toggle Markdown check marks
  -- use 'markview',             -- Improved Markdown rendering
  use 'mason',                -- LSP/DAP/etc. package manager
  use 'mason-tool-installer', -- Auto-install list of mason binaries
  use 'matchup',              -- Adds additional `%` commands
  use 'messages',             -- Floating :messages window
  use 'mini-indentscope',     -- Indentation scope
  use 'mkdir',                -- Make directory
  use 'modicator',            -- Line number mode indicator
  use 'neogen',               -- Generate type annotations
  use 'neogit',               -- Git wrapper
  use 'neoscroll',            -- Smooth scrolling animations
  use 'neotest',              -- Testing framework
  use 'notify',               -- Floating notifications popups
  use 'null-ls',              -- Autoformatting, etc.
  use 'nvim-colorizer',       -- Display colour values
  use 'nvim-tree',            -- File explorer
  use 'nvim-web-devicons',    -- File icons
  use 'nvim_devicons_conf',   -- DevIcons
  use 'octo',                 -- GitHub client
  use 'oil',                  -- Single directory file browser
  use 'onedark',              -- Colorscheme
  use 'other',                -- Go to alternate file
  use 'outline',              -- Code outline sidebar
  use 'output-panel',         -- LSP logs panel
  use 'overseer',             -- Task runner
  use 'package-info',         -- Show package.json versions
  use 'possession',           -- Session manager
  use 'printer',              -- Print text-object
  use 'refjump',              -- Jump to next/previous reference
  use 'reloader',             -- Hot reload Neovim config
  use 'rustaceanvim',         -- rust-analyzer client
  use 'signify',              -- Signify
  use 'star_search',          -- Star search
  use 'telescope_conf',       -- Telescope
  -- use 'gutentags',            -- Automatic tag management
  use 'term-edit',            -- Better editing in :terminal
  use 'toggle_view',          -- Toggle Window
  use 'toggleterm_conf',      -- Toggleterm
  use 'treesitter',           -- Abstract syntax tree
  use 'treesj',               -- Multiline split
  use 'trim',                 -- Trim trailing whitespace
  use 'trouble',              -- Nicer list of diagnostics
  use 'tsc',                  -- TypeScript type checking
  use 'typst',                -- Typst highlighting, etc.
  use 'ultimate-autopair',    -- Auto-close brackets, etc.
  use 'unception',            -- Open files in Neovim from terminal
  use 'undotree',             -- Tree of file histories
  use 'vim-textobj',          -- Custom text objects
  use 'vim_fugitive',         -- Vim Fugitive
  use 'vimtex',               -- LaTeX utilities
  use 'whichkey_conf',        -- Which key
  use 'whitespace',
  use 'windows',              -- Automatic window resizing


  { 'tvaintrob/bicep.vim', ft = 'bicep' },
}

require('lazy').setup({
  spec = plugins,
  install = {
    colorscheme = { 'onedark' },
  },
  performance = {
    rtp = {
      disabled_plugins = { 'netrwPlugin', 'tutor' },
    },
  },
})

require("setup.init").setup()
require("functions")
require("telescope")
require("mapping")
require("defaults")

vim.keymap.set("n", ";", ":")

local setup_fns = require("nvn.plugin_setup")
local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = setup_fns.telescope
  },

  { 'nelstrom/vim-visual-star-search' },
  { 'knsh14/vim-github-link' },
  { 'machakann/vim-highlightedyank' },
  {
    'Vimjas/vim-python-pep8-indent',
    config = setup_fns.pep8_indent
  },
  { 'skywind3000/asyncrun.vim' },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = setup_fns.rose_pine
  },

  { 'mhartington/oceanic-next' },
  { 'altercation/vim-colors-solarized' },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = setup_fns.lualine
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'p00f/nvim-ts-rainbow' },
    -- build = function()
    --   vim.cmd("TSUpdate")
    -- end,
    config = setup_fns.treesitter
  },
  {
    'ntpeters/vim-better-whitespace',
    config = setup_fns.whitespace
  },

  {
    'mbbill/undotree',
    config = setup_fns.undotree
  },

  -- Common dependency
  {
    'nvim-tree/nvim-web-devicons',
    config = setup_fns.nvim_devicons
  },
  { 'nvim-lua/plenary.nvim' },

  -- -- Git related
  { 'tpope/vim-fugitive' },
  { 'kdheepak/lazygit.nvim' },
  { 'mhinz/vim-signify' },
  {
    'sindrets/diffview.nvim',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-tree/nvim-web-devicons'}
    },
    config = setup_fns.diffview
  },

  -- Make directory while saving file
  { 'jghauser/mkdir.nvim' },

  {
    'naveentiwari/vim-dirdiff',
    config = setup_fns.dirdiff
  },
  { 'naveentiwari/vim-backup' },
  {
    'chrisbra/vim-diff-enhanced',
    config = setup_fns.diffenhance
  },
  {
    'rust-lang/rust.vim',
    config = setup_fns.clangfmt
  },
  { 'wagnerf42/vim-clippy' },
  {
    'rhysd/vim-clang-format',
    config = setup_fns.clangfmt
  },
  { 'tpope/vim-eunuch' },

  { 'editorconfig/editorconfig-vim' },

  {
    'mhinz/vim-startify',
    config = setup_fns.startify
  },
  {
    'numToStr/Comment.nvim',
    config = setup_fns.comment
  },

  -- explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = setup_fns.nvim_tree
  },

  {
    'neovim/nvim-lspconfig',
    config = setup_fns.nvim_lspconfig
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lua' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = setup_fns.mason
  },

  {'onsails/lspkind.nvim'},

  { "simrat39/inlay-hints.nvim" },
  { "ray-x/lsp_signature.nvim" },

  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
    config = setup_fns.lightbuld
  },

  {
    'rmagatti/goto-preview',
    config = setup_fns.goto_preview
  },

  {
    'windwp/nvim-ts-autotag',
    config = setup_fns.autotag
  },

  {
    'windwp/nvim-autopairs',
    config = setup_fns.autopairs
  },

  {
    'stevearc/aerial.nvim',
    config = setup_fns.aerial,
  },
  {
    'NMAC427/guess-indent.nvim',
    config = setup_fns.guess_indent,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = setup_fns.nvim_colorizer,
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    config = setup_fns.which_key
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = setup_fns.nvim_ufo
  },
  {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = setup_fns.indent_blankline
  },

  {
    'mrjones2014/smart-splits.nvim',
    config = setup_fns.smart_split
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = setup_fns.toggleterm
  },

  {
    'nvnti/AbbrevMan.nvim',
    config = setup_fns.abbrev_man
  },

  { 'tveskag/nvim-blame-line' },

  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    build = function()
      vim.cmd("call fzf#install()")
    end
  },

  { 'ldelossa/litee.nvim', event = "VeryLazy" },
  {
    'ldelossa/litee-calltree.nvim',
    dependencies = 'ldelossa/litee.nvim',
    event = "VeryLazy",
    config = setup_fns.litee
  },
  {
    'ldelossa/litee-filetree.nvim',
    dependencies = 'ldelossa/litee.nvim',
    event = "VeryLazy",
    config = setup_fns.litee
  },
  {
    'ldelossa/litee-symboltree.nvim',
    dependencies = 'ldelossa/litee.nvim',
    event = "VeryLazy",
    config = setup_fns.litee
  },
}

return plugins

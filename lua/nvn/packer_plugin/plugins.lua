-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nelstrom/vim-visual-star-search')
  use{
    'junegunn/fzf',
    run = './install --all --no-update-rc',
    requires = { 'junegunn/fzf.vim' }
  }

  -- Git lab link
  use('knsh14/vim-github-link')

  use('machakann/vim-highlightedyank')

  use('Vimjas/vim-python-pep8-indent')

  use('skywind3000/asyncrun.vim')

  -- Color scheme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  use('mhartington/oceanic-next')
  use('altercation/vim-colors-solarized')

  -- Nice status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Highlighting and Syntax
  use{
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'p00f/nvim-ts-rainbow' }
  }
  use('ntpeters/vim-better-whitespace')

  -- use('theprimeagen/harpoon')
  use('mbbill/undotree')

  -- Common dependency
  use('nvim-tree/nvim-web-devicons')
  use('nvim-lua/plenary.nvim')

  -- Git related
  use('tpope/vim-fugitive')
  use('kdheepak/lazygit.nvim')
  use('mhinz/vim-signify')
  use{
    'sindrets/diffview.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-tree/nvim-web-devicons'}
    }
  }

  -- Make directory while saving file
  use {'jghauser/mkdir.nvim'}

  use('naveentiwari/vim-dirdiff')
  use('naveentiwari/vim-backup')  -- TODO
  use('chrisbra/vim-diff-enhanced')
  use('rust-lang/rust.vim')
  use('wagnerf42/vim-clippy')
  use('rhysd/vim-clang-format')
  use('tpope/vim-eunuch')

  use('editorconfig/editorconfig-vim')

  use('mhinz/vim-startify')
  use('numToStr/Comment.nvim')

  -- explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- LSP related plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      {'onsails/lspkind.nvim'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

      { "simrat39/inlay-hints.nvim" },
      { "ray-x/lsp_signature.nvim" }
    }
  }

  use { 'simrat39/rust-tools.nvim' }

  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  use { 'rmagatti/goto-preview' }

  use('windwp/nvim-ts-autotag')

  use {
    "windwp/nvim-autopairs",
  }

  use('stevearc/aerial.nvim')
  use('rafamadriz/friendly-snippets')
  use('NMAC427/guess-indent.nvim')

  use('NvChad/nvim-colorizer.lua')
  use('folke/which-key.nvim')

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  use('lukas-reineke/indent-blankline.nvim')

  use('mrjones2014/smart-splits.nvim')

  use('akinsho/toggleterm.nvim')

  -- use('Shatur/neovim-session-manager')

end)


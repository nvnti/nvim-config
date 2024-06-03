local setup_fns = require("nvn.plugin_setup")
local plugins = {
  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = setup_fns.telescope_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "nelstrom/vim-visual-star-search",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "knsh14/vim-github-link",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "machakann/vim-highlightedyank",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "Vimjas/vim-python-pep8-indent",
      config = setup_fns.pep8_indent_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "skywind3000/asyncrun.vim",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "rose-pine/neovim",
      name = "rose-pine",
      config = setup_fns.rose_pine_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "mhartington/oceanic-next",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "altercation/vim-colors-solarized",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "mhartington/formatter.nvim",
      config = setup_fns.lua_fmt_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = setup_fns.lualine_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-treesitter/nvim-treesitter",
      -- build = function()
      --   vim.cmd("TSUpdate")
      -- end,
      config = setup_fns.treesitter_conf,
    },
  },
  {
    info = {
      type = "always",
    },
    settings = {
      'HiPhish/rainbow-delimiters.nvim'
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "ntpeters/vim-better-whitespace",
      config = setup_fns.whitespace_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "mbbill/undotree",
      config = setup_fns.undotree_conf,
    },
  },

  -- Common dependency
  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-tree/nvim-web-devicons",
      config = setup_fns.nvim_devicons_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- -- Git related
  {
    info = {
      type = "always",
    },
    settings = {
      "tpope/vim-fugitive",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "kdheepak/lazygit.nvim",
      dependencies =  {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
      },
      config = setup_fns.lazy_git_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "mhinz/vim-signify",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "sindrets/diffview.nvim",
      dependencies = {
        {
          "nvim-lua/plenary.nvim",
        },
        {
          "nvim-tree/nvim-web-devicons",
        },
      },
      config = setup_fns.diffview_conf,
    },
  },

  -- Make directory while saving file
  {
    info = {
      type = "always",
    },
    settings = {
      "jghauser/mkdir.nvim",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "naveentiwari/vim-dirdiff",
      config = setup_fns.dirdiff_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "naveentiwari/vim-backup",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "chrisbra/vim-diff-enhanced",
      config = setup_fns.diffenhance_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "rust-lang/rust.vim",
      config = setup_fns.clangfmt_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "wagnerf42/vim-clippy",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "rhysd/vim-clang-format",
      config = setup_fns.clangfmt_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "tpope/vim-eunuch",
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "editorconfig/editorconfig-vim",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "mhinz/vim-startify",
      config = setup_fns.startify_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "numToStr/Comment.nvim",
      config = setup_fns.comment_conf,
    },
  },

  -- explorer
  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-tree/nvim-tree.lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = setup_fns.nvim_tree_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "neovim/nvim-lspconfig",
      config = setup_fns.nvim_lspconfig_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "hrsh7th/cmp-buffer",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "hrsh7th/cmp-path",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "hrsh7th/cmp-cmdline",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "hrsh7th/nvim-cmp",
      config = setup_fns.nvim_cmp_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "hrsh7th/cmp-nvim-lua",
    },
  },

  -- Snippets
  {
    info = {
      type = "coding",
    },
    settings = {
      "L3MON4D3/LuaSnip",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "saadparwaiz1/cmp_luasnip",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "rafamadriz/friendly-snippets",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
      },
      config = setup_fns.mason_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "onsails/lspkind.nvim",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "simrat39/inlay-hints.nvim",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "ray-x/lsp_signature.nvim",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "kosayoda/nvim-lightbulb",
      dependencies = "antoinemadec/FixCursorHold.nvim",
      config = setup_fns.lightbuld_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "rmagatti/goto-preview",
      config = setup_fns.goto_preview_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "windwp/nvim-ts-autotag",
      config = setup_fns.autotag_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "windwp/nvim-autopairs",
      config = setup_fns.autopairs_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "stevearc/aerial.nvim",
      config = setup_fns.aerial_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "NMAC427/guess-indent.nvim",
      config = setup_fns.guess_indent_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "NvChad/nvim-colorizer.lua",
      config = setup_fns.nvim_colorizer_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "folke/which-key.nvim",
      lazy = true,
      config = setup_fns.which_key_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "kevinhwang91/nvim-ufo",
      dependencies = {
        "kevinhwang91/promise-async",
      },
      config = setup_fns.nvim_ufo_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "goolord/alpha-nvim",
      config = function()
        require("alpha").setup(require("alpha.themes.dashboard").config)
      end,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "lukas-reineke/indent-blankline.nvim",
      config = setup_fns.indent_blankline_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "mrjones2014/smart-splits.nvim",
      config = setup_fns.smart_split_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = setup_fns.toggleterm_conf,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      "nvnti/AbbrevMan.nvim",
      config = setup_fns.abbrev_man_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "tveskag/nvim-blame-line",
    },
  },

  {

    info = {
      type = "coding",
    },
    settings = {
      "junegunn/fzf.vim",
      dependencies = {
        "junegunn/fzf",
      },
      build = function()
        vim.cmd("call fzf#install()")
      end,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "ldelossa/litee.nvim",
      event = "VeryLazy",
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "ldelossa/litee-calltree.nvim",
      dependencies = "ldelossa/litee.nvim",
      event = "VeryLazy",
      config = setup_fns.litee_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "ldelossa/litee-filetree.nvim",
      dependencies = "ldelossa/litee.nvim",
      event = "VeryLazy",
      config = setup_fns.litee_conf,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "ldelossa/litee-symboltree.nvim",
      dependencies = "ldelossa/litee.nvim",
      event = "VeryLazy",
      config = setup_fns.litee_conf,
    },
  },
}

return plugins

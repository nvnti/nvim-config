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
      type = "coding",
    },
    settings = {
      'rcarriga/nvim-notify',
      config = setup_fns.notify,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      'AckslD/messages.nvim',
      cmd = 'Messages',
      config = function()

        require('messages').setup({
          post_open_float = function(winnr)
            vim.keymap.set("n", "<ESC>",
              function()
                vim.api.nvim_win_close(winnr, false)
              end, { buffer = true, desc = 'Close :Messages window' })
          end
        })
      end
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'j-hui/fidget.nvim',
      event = 'LspAttach',
      opts = {
        progress = {
          display = {
            done_icon = ' ',
            done_ttl = 2,
          }
        },
        notification = {
          window = {
            max_height = 4,
            normal_hl = 'FidgetNormal',
          }
        },
      }
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'freddiehaddad/feline.nvim',
      event = 'VeryLazy',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/lsp-status.nvim',
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        local colorscheme = require('nvn.utils.colorscheme')

        local default_theme = colorscheme.get_default_feline_highlights()

        require('nvn.statusline').setup({ theme = default_theme })
        require('feline').add_theme('onedark', default_theme)

        vim.opt.laststatus = 3 -- Global statusline
      end
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'junegunn/vim-easy-align',
      dependencies = 'tpope/vim-repeat',
      keys = {
        { 'ga',  '<Plug>(EasyAlign)', mode = { 'n', 'x' }, desc = 'Align' },
        { 'gaa', 'gaiL',              remap = true,        desc = 'Align line' },
      }
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
      dependencies = {
        'williamboman/mason.nvim',               -- For installing LSP servers
        'williamboman/mason-lspconfig.nvim',     -- Integration with nvim-lspconfig
        'b0o/schemastore.nvim',                  -- YAML/JSON schemas
        'davidosomething/format-ts-errors.nvim', -- Prettier TypeScript errors
        'hrsh7th/cmp-nvim-lsp',                  -- Improved LSP capabilities
        'lvimuser/lsp-inlayhints.nvim',          -- Inlay hints
        { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
      },
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
      dependencies = 'mireq/luasnip-snippets', -- Collection of snippets
      config = function()
        local fn = vim.fn
        local feedkeys, map = require('nvn.utils').feedkeys, require('nvn.utils').map

        local luasnip = require('luasnip')
        local snippets_snip_utils = require('luasnip_snippets.common.snip_utils')
        local s, sn   = luasnip.snippet, luasnip.snippet_node
        local t, i, d = luasnip.text_node, luasnip.insert_node, luasnip.dynamic_node

        luasnip.config.setup({ history = true })
        snippets_snip_utils.setup()

        luasnip.setup({
          load_ft_func = snippets_snip_utils.load_ft_func,
          ft_func = snippets_snip_utils.ft_func,
        })

        luasnip.filetype_extend('all', {'global'})
        require('luasnip.loaders.from_vscode').load({
          paths = { '~/.config/nvim/snippets' },
        })

        local function clipboard_oneline_node()
          local clipboard, _ = fn.getreg('+'):gsub('\n', ' ')
          return clipboard
        end

        local luasnip_clipboard = function()
          return sn(nil, i(1, clipboard_oneline_node()))
        end

        local plugin_repo_snippet = function()
          local repo, _ = clipboard_oneline_node():gsub('.*github.com/([^/]*/[^/]*).*', '%1', 1)
          return sn(nil, i(1, repo))
        end

        local function uuid()
          local id, _ = vim.fn.system('uuidgen'):gsub('\n', '')
          return id
        end

        luasnip.add_snippets('global', {
          s({
            trig = 'uuid',
            name = 'UUID',
            dscr = 'Generate a unique UUID'
          }, {
              d(1, function() return sn(nil, i(1, uuid())) end)
            })
        })
        luasnip.add_snippets('markdown', {
          s({
            trig = 'link',
            name = 'hyperlink',
            dscr = 'Hyperlink with the content in the clipboard'
          }, {
              t '[', i(1, 'text'), t ']',
              t '(', d(2, luasnip_clipboard), t ') ',
            })
        })
        luasnip.add_snippets('lua', {
          s({
            trig = 'plugin',
            name = 'Add plugin config',
            dscr = 'Add plugin URL from the clipboard'
          }, {
              t { "return {", "\t'" },
              d(1, plugin_repo_snippet), t "',",
              t { '', '\tconfig = function()', '\t\t' },
              i(2),
              t { '', '\tend', '}' }
            })
        })

        local function right_or_snip_next()
          if luasnip.in_snippet() and luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif fn.mode() == 'i' then
            feedkeys('<Right>')
          end
        end

        local function left_or_snip_prev()
          if luasnip.in_snippet() and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          elseif fn.mode() == 'i' then
            feedkeys('<Left>')
          end
        end

        local function toggle_active_choice()
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          end
        end

        map({'i', 's'}, '<M-S-l>', right_or_snip_next,   '<Right> or next snippet')
        map({'i', 's'}, '<M-S-h>', left_or_snip_prev,    '<Left> or previous snippet')
        map({'i', 's'}, '<M-.>',   right_or_snip_next,   '<Right> or next snippet')
        map({'i', 's'}, '<M-,>',   left_or_snip_prev,    '<Left> or previous snippet')
        map({'i', 's'}, '<M-t>',   toggle_active_choice, 'Toggle active snippet choice')
      end
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

local setup_fns = require("nvn.plugin_setup")
local plugins = {
  {
    info = {
      type = "always",
    },
    settings = {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'jvgrootveld/telescope-zoxide' },
        { 'nvim-telescope/telescope-cheat.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-frecency.nvim' },
        { 'nvim-telescope/telescope-dap.nvim' },
        { 'Zane-/cder.nvim' },
        { 'rcarriga/nvim-notify' },
        { 'mfussenegger/nvim-dap' },
        { 'rafi/telescope-thesaurus.nvim' },
        { 'ThePrimeagen/git-worktree.nvim' },
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
      type = "coding",
    },
    settings = {
      'kaarmu/typst.vim',
      ft = 'typst',
      config = function()
        vim.g.typst_auto_open_quickfix = 0
      end,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      'anuvyklack/windows.nvim',
      event = 'WinEnter',
      dependencies = 'anuvyklack/middleclass',
      config = function()
        require('windows').setup({
          animation = { enable = false },
          ignore = {
            buftype = { 'quickfix', 'help' },
            filetype = { '', 'toggleterm', 'neotest-summary', 'blame' },
          },
        })

        local map = require('nvn.utils').map
        local commands = require('windows.commands')

        map('n', '<C-w><C-f>', commands.maximize, 'Toggle maximized window')
      end,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      'dmmulroy/tsc.nvim',
      cmd = 'TSC',
      opts = {
        auto_open_qflist = false,
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
        flags = {
          skipLibCheck = true,
        },
      },
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'altermo/ultimate-autopair.nvim',
      dependencies = 'hrsh7th/nvim-cmp',
      event = { 'InsertEnter', 'CmdlineEnter' },
      branch = 'v0.6',
      enabled = function()
        return not vim.opt.diff:get()
      end,
      config = function()
        require('ultimate-autopair').setup({
          extensions = {
            filetype = {
              nft = { 'TelescopePrompt', 'DressingInput', 'NoiceCommandline' },
            },
          },
          { '**', '**', ft = { 'markdown' }, multiline = false },
          { '*',  '*',  ft = { 'markdown' }, multiline = false },
          { '_',  '_',  ft = { 'markdown' }, multiline = false },
          { '$',  '$',  ft = { 'tex' },      multiline = false },

          { '<',  '>',  fly = true,          dosuround = true, multiline = false, space = true, surround = true },
          config_internal_pairs = {
            {
              "'",
              "'",
              multiline = false,
              surround = true,
              alpha = true,
              cond = function(fn)
                -- Don't autopair apostrophes in Rust lifetimes
                return fn.get_ft() ~= 'rust' or not fn.in_node({
                  'bounded_type',
                  'reference_type',
                  'type_arguments',
                  'type_parameters',
                })
              end,
              nft = { 'tex', 'lisp' }, -- Taken from default config
            },
          },
          bs = {
            map = { '<BS>', '<C-h>' },
            cmap = { '<BS>', '<C-h>' },
          },
        })

        local cmp = require('cmp')
        local kind = cmp.lsp.CompletionItemKind

        local function ls_name_from_event(event)
          return event.entry.source.source.client.config.name
        end

        -- Add parenthesis on completion confirmation
        cmp.event:on('confirm_done', function(event)
          local ok, ls_name = pcall(ls_name_from_event, event)
          local server_blacklist = { 'rust-analyzer', 'lua_ls', 'typst_lsp', 'bicep' }
          if ok and vim.tbl_contains(server_blacklist, ls_name) then
            return
          end

          local completion_kind = event.entry:get_completion_item().kind
          if vim.tbl_contains({ kind.Function, kind.Method }, completion_kind) then
            local left = vim.api.nvim_replace_termcodes('<Left>', true, true, true)
            vim.api.nvim_feedkeys('()' .. left, 'n', false)
          end
        end)
      end,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'aznhe21/actions-preview.nvim',
      -- dependencies = 'neovim/nvim-lspconfig',
      config = function()
        local map = require('nvn.utils').map

        local actions_preview = require('actions-preview')
        actions_preview.setup({
          diff = {
            algorithm = 'patience',
            ignore_whitespace = true,
          },
          telescope = require("telescope.themes").get_dropdown({
            layout_config = { mirror = true },
          }),
        })

        map({ 'x', 'n' }, '<SPACE>la', require('actions-preview').code_actions, 'LSP code action')
      end,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'echasnovski/mini.ai',
      dependencies = {
        'tpope/vim-repeat',
        'nvim-treesitter/nvim-treesitter',
      },
      version = '*',
      event = 'VeryLazy',
      config = function()
        local gen_spec = require('mini.ai').gen_spec
        local spec_pair = gen_spec.pair

        local function pair(left, right)
          if right == nil then
            right = left
          end

          return spec_pair(left, right, { type = 'balanced' })
        end

        require('mini.ai').setup({
          verbose = false,
        })
      end,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      'zjp-CN/nvim-cmp-lsp-rs',
      dependencies = 'hrsh7th/nvim-cmp',
      ft = 'rust',
      opts = {},
      enabled = function()
        return not vim.opt.diff:get()
      end,
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      'AckslD/messages.nvim',
      cmd = 'Messages',
      init = function()
        -- noice.nvim has this functionality built-in
        if not require('nvn.utils').noice_is_loaded() then
          local map = require('nvn.utils').map
          map('n', 'gm', '<cmd>Messages<CR>', 'Show messages in a floating window')
        end
      end,
      config = function()
        local map = require('nvn.utils').map

        require('messages').setup({
          post_open_float = function(winnr)
            map('n', '<Esc>', function()
              vim.api.nvim_win_close(winnr, false)
            end, { buffer = true, desc = 'Close :Messages window' })
          end,
        })
      end,
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
          },
        },
        notification = {
          window = {
            max_height = 4,
            normal_hl = 'FidgetNormal',
          },
        },
      },
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
      end,
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
      },
    },
  },

  {
    info = {
      type = "always",
    },
    settings = {
      'mawkler/onedark.nvim',
      priority = 999,
      config = function()
        local colors = require('onedark.colors').setup()
        local style = require('onedark.types').od.HighlightStyle

        local barbar_bg = '#1d2026'
        local barbar_bg_visible = '#23262d'
        local barbar_fg_gray = '#3b4048'
        local cursorline_bg = '#2f343d'
        local treesitter_context_bg = '#252933'

        require('onedark').setup({
          hide_end_of_buffer = false,
          dev = true,
          hot_reload = false,
          colors = {
            bg_search = colors.bg_visual,
            hint = colors.dev_icons.gray,
            -- bg_float = colors.bg_highlight,
            git = {
              add = colors.green0,
              change = colors.orange1,
              delete = colors.red1,
            },
          },
          overrides = function(c)
            return {
              -- General
              Substitute                               = { link = 'Search' },
              Title                                    = { fg = c.red0, style = style.Bold },
              Folded                                   = { fg = c.fg_dark, bg = c.bg1 },
              FloatBorder                              = { fg = c.blue0, bg = c.bg_float },
              Search                                   = { bg = c.bg_search },
              SpecialKey                               = { fg = c.blue0 },
              SpecialKeyWin                            = { link = 'Comment' },
              IncSearch                                = { bg = c.blue0 },
              CurSearch                                = { link = 'Search' },
              WinSeparator                             = { fg = barbar_bg, style = style.Bold },
              MatchParen                               = { fg = nil, bg = nil, style = string.format('%s,%s', style.Bold, style.Underline) },
              CursorLine                               = { bg = cursorline_bg },
              CursorColumn                             = { link = 'CursorLine' },
              CursorLineNr                             = { fg = c.green0, bg = cursorline_bg, style = style.Bold },
              MsgArea                                  = { link = 'Normal' },
              SpellBad                                 = { style = style.Undercurl, sp = c.red1 },
              Todo                                     = { link = '@text.warning' },
              -- Modes
              NormalMode                               = { fg = c.green0, bg = cursorline_bg, style = style.Bold },
              InsertMode                               = { fg = c.blue0, bg = cursorline_bg, style = style.Bold },
              VisualMode                               = { fg = c.purple0, style = style.Bold },
              CommandMode                              = { fg = c.red0, bg = cursorline_bg, style = style.Bold },
              SelectMode                               = { fg = c.cyan0, bg = cursorline_bg, style = style.Bold },
              ReplaceMode                              = { fg = c.red2, bg = cursorline_bg, style = style.Bold },
              TerminalMode                             = { fg = c.green0, bg = cursorline_bg, style = style.Bold },
              -- Custom highlights
              InlineHint                               = { fg = c.bg_visual },
              LspCodeLens                              = { link = 'InlineHint' },
              LspCodeLensSeparator                     = { link = 'LspCodeLens' },
              -- Quickfix
              qfLineNr                                 = { fg = c.fg_gutter },
              -- Treesitter
              ['@tag.delimiter']                       = { link = 'TSPunctBracket' },
              ['@text.note']                           = { fg = c.info, style = style.Bold },
              ['@text.warning']                        = { fg = c.warning, style = style.Bold },
              ['@text.danger']                         = { fg = c.error, style = style.Bold },
              ['@lsp.type.comment']                    = {}, -- Use Treesitter's highlight instead, which supports TODO, NOTE, etc.
              -- Markdown (Treesitter)
              ['@text.literal']                        = { fg = c.green0 },
              ['@text.emphasis']                       = { fg = c.purple0, style = style.Italic },
              ['@text.strong']                         = { fg = c.orange0, style = style.Bold },
              ['@punctuation.special']                 = { fg = c.red0 },
              ['@text.todo.checked.markdown']          = { fg = c.blue1 },
              ['@text.todo.unchecked.markdown']        = { link = '@text.todo.checked.markdown' },
              ['@markup.italic']                       = { fg = c.purple0, style = style.Italic },
              ['@markup.strong']                       = { fg = c.orange0, style = style.Bold },
              -- Markdown/html
              mkdLink                                  = { fg = c.blue0, style = style.Underline },
              mkdHeading                               = { link = 'Title' },
              markdownTag                              = { fg = c.purple0, style = style.Bold },
              markdownUrl                              = { link = 'mkdLink' },
              markdownWikiLink                         = { fg = c.blue0, sylte = style.Bold },
              ['@punctuation.bracket.markdown_inline'] = { link = 'markdownWikiLink' },
              htmlBold                                 = { fg = c.orange0, style = style.Bold },
              htmlItalic                               = { fg = c.purple0, style = style.Italic },
              -- TypeScript
              typescriptParens                         = { link = 'TSPunctBracket' },
              -- Git commit
              gitcommitOverflow                        = { link = 'Error' },
              gitcommitSummary                         = { link = 'htmlBold' },
              -- QuickScope
              QuickScopePrimary                        = { fg = c.red0, style = style.Bold },
              QuickScopeSecondary                      = { fg = c.orange1, style = style.Bold },
              -- Eyeliner
              EyelinerPrimary                          = { fg = c.red0, style = style.Bold },
              EyelinerSecondary                        = { fg = c.orange1, style = style.Bold },
              EyelinerDimmed                           = { fg = c.fg_dark },
              -- NvimTree
              NvimTreeFolderIcon                       = { fg = '#8094b4' },
              NvimTreeFolderName                       = { fg = c.blue0 },
              NvimTreeOpenedFolderName                 = { fg = c.blue0, style = style.Bold },
              NvimTreeOpenedFile                       = { style = style.Bold },
              NvimTreeGitDirty                         = { fg = c.orange1 },
              NvimTreeGitNew                           = { fg = c.green0 },
              NvimTreeGitIgnored                       = { fg = c.fg_dark },
              -- Telescope
              TelescopeMatching                        = { fg = c.blue0, style = style.Bold },
              TelescopePromptPrefix                    = { fg = c.fg0, style = style.Bold },
              TelescopePathSeparator                   = { fg = c.fg_dark },
              -- LSP
              LspReferenceText                         = { link = 'Search' },
              LspReferenceRead                         = { link = 'Search' },
              LspReferenceWrite                        = { link = 'Search' },
              -- Diagnostics
              DiagnosticUnderlineError                 = { style = style.Underline, sp = c.error },
              DiagnosticUnderlineWarn                  = { style = style.Underline, sp = c.warning },
              DiagnosticUnderlineHint                  = { style = style.Underline, sp = c.hint },
              DiagnosticUnderlineInfo                  = { style = style.Underline, sp = c.info },
              -- nvim-cmp
              PmenuSel                                 = { fg = c.bg1, bg = c.blue0 },
              CmpItemAbbrMatch                         = { fg = c.blue0, style = style.Bold },
              CmpItemAbbrMatchFuzzy                    = { link = 'CmpItemAbbrMatch' },
              CmpItemKindFile                          = { link = 'NvimTreeFolderIcon' },
              CmpItemKindFolder                        = { link = 'CmpItemKindFile' },
              -- Gitsigns
              GitSignsDeleteLn                         = { link = 'GitSignsDeleteVirtLn' },
              GitSignsAdd                              = { fg = colors.green0 },
              -- Fidget
              FidgetTitle                              = { fg = c.blue0, style = style.Bold },
              -- Barbar
              BufferCurrentTarget                      = { fg = c.blue0, bg = c.bg0, style = style.Bold },
              BufferVisible                            = { fg = c.fg0, bg = barbar_bg_visible },
              BufferVisibleSign                        = { fg = barbar_fg_gray, bg = barbar_bg_visible },
              BufferVisibleMod                         = { fg = c.warning, bg = barbar_bg_visible },
              BufferVisibleIndex                       = { fg = barbar_fg_gray, bg = barbar_bg_visible },
              BufferVisibleTarget                      = { fg = c.blue0, bg = barbar_bg_visible, style = style.Bold },
              BufferTabpageFill                        = { fg = barbar_fg_gray, bg = barbar_bg },
              BufferTabpages                           = { fg = c.blue0, bg = barbar_bg, style = style.Bold },
              BufferTabPagesSep                        = { link = 'BufferTabpages' },
              BufferInactive                           = { fg = '#707070', bg = barbar_bg },
              BufferInactiveSign                       = { fg = barbar_fg_gray, bg = barbar_bg },
              BufferInactiveMod                        = { fg = c.warning, bg = barbar_bg },
              BufferInactiveTarget                     = { fg = c.blue0, bg = barbar_bg, style = style.Bold },
              BufferInactiveIndex                      = { fg = barbar_fg_gray, bg = barbar_bg },
              BufferModifiedIndex                      = { fg = barbar_fg_gray, bg = barbar_bg },
              -- Grammarous
              GrammarousError                          = { style = style.Undercurl, sp = c.error },
              -- Scrollbar
              Scrollbar                                = { fg = c.bg_visual, bg = nil },
              -- Leap
              LeapMatch                                = { fg = c.orange0, style = string.format('%s,%s', style.Bold, style.Underline) },
              LeapLabel                                = { fg = c.green0, style = style.Bold },
              LeapBackdrop                             = { fg = c.fg_dark },
              -- Alpha
              AlphaHeader                              = { fg = c.green0, style = style.Bold },
              -- Treesitter context
              TreesitterContext                        = { bg = treesitter_context_bg },
              TreesitterContextLineNumber              = { fg = c.fg_gutter, bg = treesitter_context_bg },
              -- Mini indentscope
              MiniIndentScopeSymbol                    = { fg = '#39536c', style = style.Bold },
              -- Nvim-Tree
              NvimTreeIndentMarker                     = { link = 'IblIndent' },
              -- Crates
              CratesNvimVersion                        = { fg = c.fg_dark },
              CratesNvimLoading                        = { link = 'CratesNvimVersion' },
              -- Fidget
              FidgetNormal                             = { fg = c.fg_dark },
              -- Neotest
              NeotestFile                              = { fg = c.blue0 },
              NeotestDir                               = { link = 'NvimTreeFolderIcon' },
              NeotestAdapterName                       = { link = 'Title' },
              NeotestFailed                            = { fg = c.red0 },
              NeotestPassed                            = { fg = c.green0 },
              NeotestRunning                           = { fg = c.orange0 },
              NeotestWatching                          = { fg = c.orange1 },
              NeotestSkipped                           = { fg = c.fg_dark },
              NeotestUnknown                           = { link = 'NeotestSkipped' },
              NeotestMarked                            = { fg = c.purple0 },
              NeotestFocused                           = { style = style.Bold },
              ['@text.uri']                            = { link = '@markup.link.url' }, -- temporary fix for rest.nvim
              -- Gitsigns
              GitSignsAddInline                        = { link = 'DiffText' },
              -- Headlines
              Headline                                 = { fg = c.red0, bg = c.bg_visual },
              -- Helpview
              HelpviewTagLink                          = { fg = c.blue0 },
              HelpviewMentionLink                      = { fg = c.blue0, style = style.Italic },
            }
          end,
        })
      end,
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
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {},
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
      'HiPhish/rainbow-delimiters.nvim',
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
      keys = '\\u',
      cmd = { 'UndoTreeShow', 'UndoTreeToggle' },
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
      'nvimdev/hlsearch.nvim',
      event = 'VeryLazy',
      opts = {},
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

  {
    info = {
      type = "always",
    },
    settings = {
      'b0o/incline.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      event = 'WinNew',
      config = function()
        local get_highlight = require('nvn.utils.colors').get_highlight

        require('incline').setup({
          hide = {
            focused_win = true,
            only_win = true,
          },
          window = {
            zindex = 1,
            winhighlight = {
              Normal = {
                guifg = get_highlight('Comment'),
                guibg = nil,
              },
            },
            margin = { vertical = 0 },
          },
          render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
            local icon, color = require('nvim-web-devicons').get_icon_color(filename)
            return {
              { icon,     guifg = color },
              { ' ' },
              { filename, gui = 'italic' },
            }
          end,
        })
      end,
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
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
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
      'lvimuser/lsp-inlayhints.nvim',
      branch = 'anticonceal',
      event = 'LspAttach',
      enabled = function()
        return not vim.opt.diff:get()
      end,
      opts = {
        inlay_hints = {
          parameter_hints = {
            remove_colon_start = false,
          },
          type_hints = {
            remove_colon_start = false,
            remove_colon_end = false,
          },
        },
      },
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
        local fn                  = vim.fn
        local feedkeys, map       = require('nvn.utils').feedkeys, require('nvn.utils').map

        local luasnip             = require('luasnip')
        local snippets_snip_utils = require('luasnip_snippets.common.snip_utils')
        local s, sn               = luasnip.snippet, luasnip.snippet_node
        local t, i, d             = luasnip.text_node, luasnip.insert_node, luasnip.dynamic_node

        luasnip.config.setup({ history = true })
        snippets_snip_utils.setup()

        luasnip.setup({
          load_ft_func = snippets_snip_utils.load_ft_func,
          ft_func = snippets_snip_utils.ft_func,
        })

        luasnip.filetype_extend('all', { 'global' })
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
            dscr = 'Generate a unique UUID',
          }, {
            d(1, function() return sn(nil, i(1, uuid())) end),
          }),
        })
        luasnip.add_snippets('markdown', {
          s({
            trig = 'link',
            name = 'hyperlink',
            dscr = 'Hyperlink with the content in the clipboard',
          }, {
            t '[', i(1, 'text'), t ']',
            t '(', d(2, luasnip_clipboard), t ') ',
          }),
        })
        luasnip.add_snippets('lua', {
          s({
            trig = 'plugin',
            name = 'Add plugin config',
            dscr = 'Add plugin URL from the clipboard',
          }, {
            t { "return {", "\t'" },
            d(1, plugin_repo_snippet), t "',",
            t { '', '\tconfig = function()', '\t\t' },
            i(2),
            t { '', '\tend', '}' },
          }),
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

        map({ 'i', 's' }, '<M-S-l>', right_or_snip_next, '<Right> or next snippet')
        map({ 'i', 's' }, '<M-S-h>', left_or_snip_prev, '<Left> or previous snippet')
        map({ 'i', 's' }, '<M-.>', right_or_snip_next, '<Right> or next snippet')
        map({ 'i', 's' }, '<M-,>', left_or_snip_prev, '<Left> or previous snippet')
        map({ 'i', 's' }, '<M-t>', toggle_active_choice, 'Toggle active snippet choice')
      end,
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
      'mrcjkb/rustaceanvim',
      dependencies = 'neovim/nvim-lspconfig',
      version = '^5',
      lazy = false,
      ft = { 'rust' },
      enabled = function()
        return false
        -- return not vim.opt.diff:get()
      end,
      config = setup_fns.rustaceanvim,
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

  -- {
  --   info = {
  --     type = "coding",
  --   },
  --   settings = {
  --     "simrat39/inlay-hints.nvim",
  --   },
  -- },

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
      'nvimtools/none-ls.nvim',
      dependencies = 'nvim-lua/plenary.nvim',
      event = 'VeryLazy',
      config = function()
        local b = vim.b
        local map = require('nvn.utils').map
        local null_ls, builtins = require('null-ls'), require('null-ls').builtins

        local sources = {
          builtins.formatting.prettier,
          builtins.hover.dictionary,
          builtins.formatting.shfmt.with({
            args = { '-sr' }, -- Space after redirects
          }),
        }

        null_ls.setup({
          sources = sources,
          on_attach = function(client, bufnr)
            require('utils.formatting').format_on_write(client, bufnr)
          end,
        })

        map('n', '<F2>', function()
          b.format_on_write = (not b.format_on_write and b.format_on_write ~= nil)
          vim.notify(
            'Format on write '
            .. (b.format_on_write and 'enabled' or 'disabled')
          )
        end, 'Toggle autoformatting on write')
      end,
    },
  },

  {
    info = {
      type = "coding",
    },
    settings = {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup {
          filetypes = { "*" },
          user_default_options = {
            RGB = true,          -- #RGB hex codes
            RRGGBB = true,       -- #RRGGBB hex codes
            names = true,        -- "Name" codes like Blue or blue
            RRGGBBAA = false,    -- #RRGGBBAA hex codes
            AARRGGBB = false,    -- 0xAARRGGBB hex codes
            rgb_fn = false,      -- CSS rgb() and rgba() functions
            hsl_fn = false,      -- CSS hsl() and hsla() functions
            css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
            -- Available modes for `mode`: foreground, background,  virtualtext
            mode = "background", -- Set the display mode.
            -- Available methods are false / true / "normal" / "lsp" / "both"
            -- True is same as normal
            tailwind = false,                               -- Enable tailwind colors
            -- parsers can contain values used in |user_default_options|
            sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
            virtualtext = "■",
            -- update color values even if buffer is not focused
            -- example use: cmp_menu, cmp_docs
            always_update = false,
          },
          -- all the sub-options of filetypes apply to buftypes
          buftypes = {},
        }
      end,
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
      keys = {
        {
          "<Space><Space>",
          function()
            require("which-key").show({ global = true })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
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
      'goolord/alpha-nvim',
      dependencies = 'nvim-tree/nvim-web-devicons',
      event = 'VimEnter',
      config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        local lazy = require('lazy')
        local section = dashboard.section
        local fn = vim.fn

        -- Header
        section.header.opts.hl = 'AlphaHeader'
        section.header.val = {
          '                                                     ',
          '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
          '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
          '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
          '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
          '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
          '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
          '                                                     ',
        }

        -- Menu
        section.buttons.val = {
          dashboard.button('<Leader>so', '  Open session'),
          dashboard.button('<Leader>m', '  Most recent files'),
          dashboard.button('<C-p>', '  Find file'),
          dashboard.button('i', '  New file', ':enew <BAR> startinsert<CR>'),
          dashboard.button('<C-q>', '  Quit'),
        }

        -- Footer
        local Footer = { items = {} }

        function Footer:add(icon, item, condition)
          if condition == nil or condition then
            table.insert(self.items, string.format('%s %s', icon, tostring(item)))
          end
        end

        function Footer:create()
          return table.concat(self.items, '  |  ')
        end

        local lazy_stats = lazy.stats()
        local loaded_plugins = string.format(
          '%d/%d plugins',
          lazy_stats.loaded,
          lazy_stats.count
        )

        local version = vim.version() or {}
        local date = os.date('%d-%m-%Y')
        local version_string = string.format(
          'v%s.%d.%d',
          version.major,
          version.minor,
          version.patch
        )

        Footer:add('', loaded_plugins)
        Footer:add('', version_string)
        Footer:add('', date)

        section.footer.val = Footer:create()
        section.footer.opts.hl = 'NonText'

        -- Layout
        local topMarginRatio = 0.2
        local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * topMarginRatio) })

        dashboard.config.layout = {
          { type = 'padding', val = headerPadding },
          section.header,
          { type = 'padding', val = 2 },
          section.buttons,
          { type = 'padding', val = 2 },
          section.footer,
        }

        alpha.setup(dashboard.opts)
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

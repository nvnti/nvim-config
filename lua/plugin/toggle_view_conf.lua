-----------------
-- Toggle Window
-----------------
return {
  'gregorias/toggle.nvim',
  dependencies = {
    'folke/which-key.nvim',
    'echasnovski/mini.icons',
  },
  version = "2.0",
  keys = {
    {
      "<Space><Space>",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },

  config = function()
    local toggle = require "toggle"

    require('mini.icons').setup()

    toggle.setup {
      keymaps = {
        toggle_option_prefix = "\\T",
        previous_option_prefix = "[o",
        next_option_prefix = "]o",
        status_dashboard = "yos",
      },
      -- The interface for registering keymaps.
      keymap_registry = require("toggle.keymap").keymap_registry(),
      -- See the default options section below.
      -- options_by_keymap = …,
      --- Whether to notify when a default option is set.
      notify_on_set_default_option = true,
    }

    local bufnr = vim.fn.bufnr()

    toggle.register(
      "h",
      -- Toggles inlay hints
      toggle.option.NotifyOnSetOption(toggle.option.OnOffOption({
        name = "inlay hints",
        get_state = function()
          return vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        end,
        set_state = function(new_value)
          require('lsp-inlayhints').toggle()
        end,
      })),
      { buffer = bufnr }
    )

    -- Toggle whitespace
    toggle.register(
      "W",
      -- Toggle whitespace comparison in diff mode
      toggle.option.NotifyOnSetOption(toggle.option.OnOffOption({
        name = "diff whitespace",
        get_state = function()
          return false
        end,
        set_state = function(new_value)
          require('functions.toggles').toggle_diff_whitespace()
        end,
      })),
      { buffer = bufnr }
    )

    toggle.register(
      "T",
      -- Toggle file explorer
      toggle.option.NotifyOnSetOption(toggle.option.OnOffOption({
        name = "File explorer",
        get_state = function()
          return false
        end,
        set_state = function(new_value)
          return require("nvim-tree.api").tree.toggle({ focus = true, find_file = true })
        end,
      })),
      { buffer = bufnr }
    )
  end,
}

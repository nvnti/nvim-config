---------------
-- Nvim-tree --
---------------

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- lazy = vim.fn.argc() == 0,
  -- keys = {
  --   { '<SPACE>et`', function() require('nvim-tree.api').tree.toggle() end, mode = 'n', desc = 'Toggle file tree' },
  --   { '<SPACE>ef',  find_file,                                             mode = 'n', desc = 'Show current file in file tree' },
  -- },
  config = function()
    -- Set the global variables
    vim.g.nvim_tree_width_allow_resize = 1
    vim.g.nvim_tree_current_width      = 40

    -- disable netrw at the very start
    vim.g.loaded_netrw                 = 1
    vim.g.loaded_netrwPlugin           = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors              = true

    local tree_mapping_list            = {
      { key = "-",                              action = "dir_up" },
      { key = ".",                              action = "run_file_command" },
      { key = "<",                              action = "prev_sibling" },
      { key = "<C-e>",                          action = "edit_in_place" },
      { key = "<C-k>",                          action = "toggle_file_info" },
      { key = "<C-r>",                          action = "full_rename" },
      { key = "<C-t>",                          action = "tabnew" },
      { key = "<C-v>",                          action = "vsplit" },
      { key = "<C-x>",                          action = "split" },
      { key = "<Tab>",                          action = "preview" },
      { key = ">",                              action = "next_sibling" },
      { key = "D",                              action = "trash" },
      { key = "F",                              action = "clear_live_filter" },
      { key = "H",                              action = "toggle_dotfiles" },
      { key = "I",                              action = "toggle_git_ignored" },
      { key = "J",                              action = "last_sibling" },
      { key = "K",                              action = "first_sibling" },
      { key = "P",                              action = "parent_node" },
      { key = "R",                              action = "rename" },
      { key = "S",                              action = "search_node" },
      { key = "W",                              action = "collapse_all" },
      { key = "Y",                              action = "copy_path" },
      { key = "[c",                             action = "prev_git_item" },
      { key = "]c",                             action = "next_git_item" },
      { key = "a",                              action = "create" },
      { key = "c",                              action = "copy" },
      { key = "d",                              action = "remove" },
      { key = "f",                              action = "live_filter" },
      { key = "gy",                             action = "copy_absolute_path" },
      { key = "h",                              action = "toggle_help" },
      { key = "p",                              action = "paste" },
      { key = "q",                              action = "close" },
      { key = "r",                              action = "refresh" },
      { key = "s",                              action = "split" },
      { key = "v",                              action = "vsplit" },
      { key = "x",                              action = "cut" },
      { key = "y",                              action = "copy_name" },
      { key = { "<2-RightMouse>", "<C-]>" },    action = "cd" },
      { key = { "<BS>", "<S-CR>" },             action = "close_node" },
      { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
      { key = { "O" },                          action = "edit_no_picker" },
    }

    require('nvim-tree').setup {
      actions              = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
      auto_reload_on_write = true,
      diagnostics          = {
        enable = true,
      },
      disable_netrw        = false,
      filters              = {
        dotfiles = false,
        custom = {},
      },
      git                  = {
        enable = true,
        ignore = true,
        timeout = 5000,
      },
      hijack_cursor        = false,
      hijack_netrw         = true,
      open_on_tab          = false,
      renderer             = {
        group_empty = true,
        highlight_opened_files = "all",
        highlight_git = true,
        icons = {
          git_placement = "before",
          glyphs = {
            default = '',
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
            symlink = '',
          },
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
      },
      system_open          = {
        cmd  = nil,
        args = {},
      },
      trash                = {
        cmd = "trash",
        require_confirm = true,
      },
      update_cwd           = false,
      hijack_directories   = {
        enable = true,
        auto_open = true,
      },
      update_focused_file  = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {},
      },
      view                 = {
        adaptive_size = false,
        number = false,
        relativenumber = false,
        side = 'left',
        width = 40,
      },
      filters              = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { 'node_modules', 'target', 'target-nvim' },
      },
    }
  end,
}

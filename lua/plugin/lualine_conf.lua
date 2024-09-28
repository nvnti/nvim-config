----------------------------
--
-------------------------------
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- enabled = function()
  --   return false
  -- end,
  config = function()
    local move = require('functions.move')

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'OceanicNext',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {},
      -- sections = {
      --   lualine_a = { 'mode' },
      --   lualine_b = { 'branch', 'diff', 'diagnostics' },
      --   lualine_c = { 'filename' },
      --   lualine_x = { 'encoding', 'fileformat', 'filetype' },
      --   lualine_y = { 'progress' },
      --   lualine_z = { 'location' },
      -- },
      inactive_sections = {},
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { 'filename' },
      --   lualine_x = { 'location' },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      tabline = {
        lualine_a = { 'mode' },
        lualine_b = { '%n' },
        lualine_c = { {
          'filename',
          show_filename_only = false,
          path = 1,
        } },
        lualine_x = {},
        lualine_y = { move.current_type },
        lualine_z = { 'tabs' },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { 'nvim-tree' },
    }
  end,
}

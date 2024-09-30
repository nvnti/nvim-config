---------------------------
-- Action preview
---------------------------
return {
  'aznhe21/actions-preview.nvim',
  -- dependencies = 'neovim/nvim-lspconfig',
  config = function()
    local map = require('utils').map

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

    map("n", "<space>la", require("actions-preview").code_actions, 'Code action.')
    -- vim.keymap.set({ "v", "n" }, "<Space>la", require("actions-preview").code_actions)
  end,
}

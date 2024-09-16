----------------
-- Which key
----------------
return {
  "folke/which-key.nvim",
  keys = {
    {
      "<Space><Space>",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
  end,
}


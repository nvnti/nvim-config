----------------------------
--
-------------------------------
return {
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
}

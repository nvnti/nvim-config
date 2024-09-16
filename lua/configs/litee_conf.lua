----------------
-- Litee
----------------
return {
  "ldelossa/litee-calltree.nvim",
  dependencies = {
    "ldelossa/litee.nvim",
    "ldelossa/litee-filetree.nvim",
    "ldelossa/litee-symboltree.nvim",
  },
  config = function()
    -- configure the litee.nvim library
    require('litee.lib').setup({
      -- tree = {
      -- icon_set = "codicons"
      -- },
      notify = {
        enabled = false,
      },
      panel = {
        orientation = "right",
        panel_size = 40,
      },
    })
    -- configure litee-calltree.nvim
    require('litee.calltree').setup({
      -- icon_set = "codicons",
      on_open = "panel",
      map_resize_keys = false,
    })

    require('litee.filetree').setup({
    })
    require('litee.symboltree').setup({
      -- icon_set = "codicons",
    })


    local opts = { silent = true }

    vim.api.nvim_set_keymap("n", "<SPACE>lE", ":LTOpenFiletree<cr>", opts)
    vim.api.nvim_set_keymap("n", "<SPACE>le", ":LTPopOutFiletree<cr>", opts)
    vim.api.nvim_set_keymap("n", "<SPACE>lp", ":LTPanel<cr>", opts)
    vim.api.nvim_set_keymap("n", "<SPACE>ls",
      "<cmd>lua require('litee.lib.lsp.wrappers').buf_document_symbol()<CR>:LTPopOutSymboltree<CR>",
      opts)
    vim.api.nvim_set_keymap("n", "<SPACE>li",
      "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<CR>:LTPopOutCalltree<CR>",
      opts)
    vim.api.nvim_set_keymap("n", "<SPACE>lo",
      "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<CR>:LTPopOutCalltree<CR>",
      opts)
  end,
}


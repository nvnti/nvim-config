local gotop = require('goto-preview')

local M = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false, silent = true }

  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "<space>lD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<space>lH", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<space>lR", vim.lsp.buf.rename, opts)
  -- vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<space>ld", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<space>le", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<space>lf", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<space>lh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>li", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<space>lr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>lt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>lw", vim.lsp.buf.workspace_symbol, opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ls', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>lS', '<cmd>edit<CR>', opts)

  vim.keymap.set("n", "<space>pd", gotop.goto_preview_definition, {})
  vim.keymap.set("n", "<space>pD", gotop.goto_preview_declaration, {})
  vim.keymap.set("n", "<space>pi", gotop.goto_preview_implementation, {})
  vim.keymap.set("n", "<space>pq", gotop.close_all_win, {})
  vim.keymap.set("n", "<space>pr", gotop.goto_preview_references, {})
  vim.keymap.set("n", "<space>pt", gotop.goto_preview_type_definition, {})

  -- ih.on_attach(client, bufnr)
end

return M

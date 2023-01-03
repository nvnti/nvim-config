local lsp = require("lsp-zero")
local cmp = require('cmp')

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false, silent = true}

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "<space>lD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<space>lH", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<space>lR", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<space>ld", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<space>lf", vim.lsp.buf.formatting, opts)
  vim.keymap.set("n", "<space>lh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>li", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<space>lr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>lt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>lwd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<space>lws", vim.lsp.buf.workspace_symbol, opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ls', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>lS', '<cmd>edit<CR>', opts)

end

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(on_attach)

local cmp_mappings = lsp.defaults.cmp_mappings({
})

lsp.setup_nvim_cmp({
  -- preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
  mapping = cmp_mappings,
  sources = {
    {name = 'path', keyword_length = 2},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
  }
})

lsp.setup()

local cmp_config = lsp.defaults.cmp_config({
  window = {
    completion = cmp.config.window.bordered()
  }
})

cmp.setup(cmp_config)

vim.diagnostic.config({
    virtual_text = true,
})

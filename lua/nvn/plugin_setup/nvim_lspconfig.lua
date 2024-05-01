local M = {}

function M.fn()
  -- Set up lspconfig.
  local lspconfig = require('lspconfig')
  local nvim_cmp = require('cmp_nvim_lsp')

  local lsplocalconfig = require('nvn.lspconfig')

  local capabilities = nvim_cmp.default_capabilities()

  lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
      ['rust-analyzer'] = lsplocalconfig.confs.rust_analyzer
    },
    capabilities = capabilities,
    on_attach = lsplocalconfig.fns.on_attach,
    on_initialized = lsplocalconfig.fns.on_initialized,
  }

  lspconfig.clangd.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    capabilities = capabilities,
    on_attach = lsplocalconfig.fns.on_attach,
    on_initialized = lsplocalconfig.fns.on_initialized,
  }

  require('lsp_signature').setup(lsplocalconfig.confs.lspsignature)
  require("inlay-hints").setup(lsplocalconfig.confs.inlayhints)
end

return M

----------------------------
--
-------------------------------
return {
  'mrcjkb/rustaceanvim',
  dependencies = 'neovim/nvim-lspconfig',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  enabled = function()
    return false
    -- return not vim.opt.diff:get()
  end,
  config = function()
    local lsplocalconfig = require('lsplocalconfig')
    local nvim_cmp = require('cmp_nvim_lsp')

    local on_attach_rust = function(client, bufnr)
      lsplocalconfig.fns.on_attach(client, bufnr)
      local map = require('utils').local_map(bufnr)

      map('n', 'go', '<cmd>RustLsp openCargo<CR>', 'Go to cargo.toml')
      map('n', '<C-w>go', '<C-w>v<cmd>RustLsp openCargo<CR>', 'Go to cargo.toml (in new window)')
      map('n', '<leader>le', '<cmd>RustLsp explainError<CR>', 'Explain error')
      map('n', '<leader>lj', '<cmd>RustLsp moveItem down<CR>', 'Move item down')
      map('n', '<leader>lk', '<cmd>RustLsp moveItem up<CR>', 'Move item up')
      map('n', '<leader>dd', '<cmd>RustLsp debug<CR>', 'Debug item under cursor')
      map('n', '<leader>dD', '<cmd>RustLsp debuggables last<CR>', 'Debug')
      map('n', '<leader>ld', '<cmd>RustLsp renderDiagnostic<CR>', 'Render idiagnostics')
      map('n', '<leader>lm', '<cmd>RustLsp expandMacro<CR>', 'Expand macro')
      map('n', '<leader>lr', '<cmd>RustLsp run<CR>', 'Run')
      map('n', '<leader>lR', '<cmd>RustLsp! run<CR>', 'Rerun latest run')
    end

    vim.g.rustaceanvim = {
      server = {
        capabilities = nvim_cmp.default_capabilities(),
        on_initialized = lsplocalconfig.fns.on_initialized,

        on_attach = on_attach_rust,

        default_settings = {
          ['rust-analyzer'] = lsplocalconfig.confs.rust_analyzer,
        },
        status_notify_level = 'error',
      },
    }
  end,
}

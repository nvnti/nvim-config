local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('rust_analyzer', {
  settings = {
    assist = {
      importGranularity = "module",
      importPrefix = "by_self",
    },
    cargo = {
      features = {'dev'}
    },
    cachePriming = {
      enable = true,
      numThreads = 4
    },
    inlayHints = {
      bindingModeHints = {
        enable = false
      },
      typeHints = {
        enable = true,
        hideClosureInitialization = false,
        hideNamedConstructor = false
      }
    },
    procMacro = {
      enable = true
    },
    rustfmt = {
      extraArgs = {
        '--target-dir=target-analyzer',
        '--features=dev'
      }
    },
    checkOnSave = {
      enable = true,
      allFeatures = true,
      allTargets = true,
      command = "clippy",
      features = {'dev'},
      extraArgs = {
        '--all',
        '--target-dir=target-analyzer',

        '--',
        '-D', 'clippy::perf', '-D', 'clippy::all',
        '-D', 'clippy::needless_lifetimes'
      }
    }
  }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
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

lsp.on_attach(
function(client, bufnr)
  local opts = {buffer = bufnr, remap = false, silent = true}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  -- Enable completion triggered by <c-x><c-o>
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
)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

vim.keymap.set({"n", "v"}, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])
vim.keymap.set("n", ";", [[:]])

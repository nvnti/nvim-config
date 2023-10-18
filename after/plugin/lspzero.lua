local lsp = require("lsp-zero")
local cmp = require('cmp')
local lspkind = require("lspkind")
-- local ih = require("inlay-hints")
local gotop = require('goto-preview')
local lsp_sig = require('lsp_signature')

local lsp_sig_opts = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false, silent = true}

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "<space>lD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<space>lH", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<space>lR", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, opts)
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

  vim.keymap.set("n", "<space>gpd", gotop.goto_preview_definition, {})
  vim.keymap.set("n", "<space>gpt", gotop.goto_preview_type_definition, {})
  vim.keymap.set("n", "<space>gpi", gotop.goto_preview_implementation, {})
  vim.keymap.set("n", "<space>gP", gotop.close_all_win, {})
  vim.keymap.set("n", "<space>gpr", gotop.goto_preview_references, {})

  -- ih.on_attach(client, bufnr)
  lsp_sig.on_attach(lsp_sig_opts, bufnr)
end

local on_initialized = function()
  -- ih.set_all()
end

lsp.preset("recommended")

lsp.ensure_installed({
  'clangd',
  'lua_ls',
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
lsp.on_initialized = on_initialized

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<CR>"] = cmp.config.disable,
  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end,
  ["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end,
})

local cmp_formatting = {
  -- Youtube: How to set up nice formatting for your sources.
  format = lspkind.cmp_format {
    with_text = true,
    menu = {
      buffer = "[buf]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[api]",
      path = "[path]",
      tn = "[TabNine]",
    },
  },
}

lsp.setup_nvim_cmp({
  -- preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
  formatting = cmp_formatting,
  mapping = cmp_mappings,
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},

    {name = 'path', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  window = {
    completion = cmp.config.window.bordered()
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  experimental = {
    native_menu = false,
    ghost_text = false,
  },
})

--local rust_lsp = lsp.build_options('rust_analyzer', {
--  settings = {
--    ['rust-analyzer'] = {
--      imports = {
--        granularity = {
--          group = "module",
--        },
--        prefix = "self",
--      },
--      check = {
--        command = "clippy",
--        extraArgs = {
--          "--",
--          "-D",
--          "clippy::perf",
--          "-D",
--          "clippy::needless_lifetimes",
--          "-D",
--          "warnings",
--        }
--      },
--      cargo = {
--        buildScripts = {
--          enable = true,
--        },
--        features = "all"
--      },
--      procMacro = {
--        enable = true
--      },
--      diagnostics = {
--        enable = false;
--      }
--    }
--  }
--})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

-- require('rust-tools').setup({server = rust_lsp})

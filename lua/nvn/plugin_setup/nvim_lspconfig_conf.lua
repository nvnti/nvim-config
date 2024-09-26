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

  lspconfig.typos_lsp.setup {
    on_attach = function(client, _)
      -- Disabled for Markdown, use LTeX instead
      local disabled_filetypes = vim.iter({ 'markdown', 'NvimTree', 'help' })
      if disabled_filetypes:find(vim.bo.filetype) ~= nil then
        -- Force-shutdown seems to be necessary for some reason
        vim.lsp.stop_client(client.id, true)
      end
    end,
    init_options = {
      diagnosticSeverity = 'hint',
      -- Fixes issue where config is ignored when opening a file with
      -- Telescope from some other directory
      config = vim.env.HOME .. '/.typos.toml',
    },
  }

  lspconfig.pylsp.setup {
    settings = {
      pylsp = {
        plugins = {
          -- Disable formatting diagnostics (that's what formatters are for)
          pylint = { enabled = false },
          pycodestyle = { enabled = false },
        },
      },
    },
  }

  lspconfig.typst_lsp.setup {
    on_attach = function()
      map('n', '<SPACE>lw', '<cmd>TypstWatch<CR>', 'Watch file')
    end,
  }

  lspconfig.bicep.setup {
  }

  lspconfig.jsonls.setup {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  }

  lspconfig.bashls.setup {
    filetypes = { 'sh', 'zsh' },
  }

  lspconfig.eslint.setup {
    on_attach = function(_, bufnr)
      api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'EslintFixAll',
      })
    end,
  }

  lspconfig.yamlls.setup {
    settings = {
      yaml = {
        schemaStore = {
          url = 'https://www.schemastore.org/api/json/catalog.json',
          enable = true,
        },
        customTags = {
          -- AWS CloudFormation tags
          '!Equals sequence', '!FindInMap sequence', '!GetAtt', '!GetAZs',
          '!ImportValue', '!Join sequence', '!Ref', '!Select sequence',
          '!Split sequence', '!Sub', '!Or sequence',
        },
      },
    },
    -- Don't attach to Azure Pipeline files (azure_pipelines_ls does that)
    on_attach = function(client, bufnr)
      local path = vim.api.nvim_buf_get_name(bufnr)
      local filename = vim.fn.fnamemodify(path, ':t')
      local is_pipeline_file = #vim.fn.glob('azure-pipeline*.y*ml', true, filename) > 0

      if is_pipeline_file then
        lsp.stop_client(client)
      end
    end,
  }

  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
          autoRequire = true,
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = 'space',
            indent_size = '2',
            max_line_length = '100',
            trailing_table_separator = 'smart',
          },
        },
        diagnostics = {
          globals = { 'vim', 'it', 'describe', 'before_each', 'are' },
        },
        hint = {
          enable = true,
          arrayIndex = 'Disable',
        },
        workspace = {
          checkThirdParty = false,
          library = { vim.env.VIMRUNTIME }, -- Fixes issue with `vim` global missing?
        },
        telemetry = {
          enable = false,
        },
      },
    },
    on_attach = function()
      map('n', '<SPACE>lt', '<Plug>PlenaryTestFile', "Run file's plenary tests")
    end,
  }

  lspconfig.clangd.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    capabilities = capabilities,
    on_attach = lsplocalconfig.fns.on_attach,
    on_initialized = lsplocalconfig.fns.on_initialized,
  }

  require('lsp_signature').setup(lsplocalconfig.confs.lspsignature)
  require("inlay-hints").setup(lsplocalconfig.confs.inlayhints)

  vim.diagnostic.config({
    virtual_text = true,
    underline = false
  })

end

return M

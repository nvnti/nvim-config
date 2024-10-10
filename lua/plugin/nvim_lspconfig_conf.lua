----------------------------
--
-------------------------------
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'williamboman/mason.nvim',               -- For installing LSP servers
    'williamboman/mason-lspconfig.nvim',     -- Integration with nvim-lspconfig
    'b0o/schemastore.nvim',                  -- YAML/JSON schemas
    'davidosomething/format-ts-errors.nvim', -- Prettier TypeScript errors
    'hrsh7th/cmp-nvim-lsp',                  -- Improved LSP capabilities
    'lvimuser/lsp-inlayhints.nvim',          -- Inlay hints
    { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  },
  enabled = function()
    return not vim.opt.diff:get()
  end,
  config = function()
    -- Set up lspconfig.
    local lspconfig = require('lspconfig')
    local nvim_cmp = require('cmp_nvim_lsp')

    local lsplocalconfig = require('lsplocalconfig')
    local capabilities = nvim_cmp.default_capabilities()

    local function attach_codelens(bufnr)
      local augroup = vim.api.nvim_create_augroup('Lsp', {})
      vim.api.nvim_create_autocmd({ 'BufReadPost', 'CursorHold', 'InsertLeave' }, {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.codelens.refresh({ bufnr = bufnr })
        end,
      })
    end

    local function on_attach_rust_analyzer(_, bufnr)
      lsplocalconfig.fns.on_attach()
      attach_codelens(bufnr)
    end

    lspconfig.rust_analyzer.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ['rust-analyzer'] = lsplocalconfig.confs.rust_analyzer,
      },
      capabilities = capabilities,
      on_attach = on_attach_rust_analyzer,
      on_initialized = lsplocalconfig.fns.on_initialized,
    }

    lspconfig.typos_lsp.setup {
      on_attach = function(client, _)
        lsplocalconfig.fns.on_attach()
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
      on_attach = function(_, bufnr)
        lsplocalconfig.fns.on_attach()
        local map = require('utils').local_map(bufnr)
        map('n', '<SPACE>lw', '<cmd>TypstWatch<CR>', 'Watch file')
      end,
    }

    lspconfig.bicep.setup {
      on_attach = lsplocalconfig.fns.on_attach,
    }

    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
      on_attach = lsplocalconfig.fns.on_attach,
    }

    lspconfig.bashls.setup {
      filetypes = { 'sh', 'zsh' },
      on_attach = lsplocalconfig.fns.on_attach,
    }

    lspconfig.eslint.setup {
      on_attach = function(_, bufnr)
        lsplocalconfig.fns.on_attach()
        vim.api.nvim_create_autocmd('BufWritePre', {
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
        lsplocalconfig.fns.on_attach()
        local path = vim.api.nvim_buf_get_name(bufnr)
        local filename = vim.fn.fnamemodify(path, ':t')
        local is_pipeline_file = #vim.fn.glob('azure-pipeline*.y*ml', true, filename) > 0

        if is_pipeline_file then
          vim.lsp.stop_client(client)
        end
      end,
    }

    lspconfig.gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

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
      on_attach = lsplocalconfig.fns.on_attach,
    }

    lspconfig.clangd.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      capabilities = capabilities,
      on_attach = lsplocalconfig.fns.on_attach,
      on_initialized = lsplocalconfig.fns.on_initialized,
    }

    require('lsp_signature').setup(lsplocalconfig.confs.lspsignature)

    -- This has to be called from LspAttach event for some reason, not sure why
    vim.diagnostic.config({
      signs = false,
      virtual_text = {
        spacing = 4,
        prefix = function(diagnostic, _, _)
          local icon = require('config.diagnostics').get_icon(diagnostic.severity)
          return ' ' .. icon
        end,
      },
    })

    ---------------------
    -- Handler configs --
    ---------------------
    if not require('utils').noice_is_loaded() then
      -- Add borders to hover/signature windows (noice.nvim has its own)
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = 'single',
          -- Disable "no information available" popup which is really annoying
          -- when using multiple servers
          silent = true,
        }
      )

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'single' }
      )
    end
  end,
}

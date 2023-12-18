local lsp_sig = require('lsp_signature')
local rusttools = require('rust-tools')
local gotop = require('goto-preview')

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

local opts = {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix / toggleterm / vimux
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = on_initialized,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = true,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = true,

        imports = {
          granularity = {
            group = "crate",
            enforce = true
          },

          prefix = "self",
        },

        procMacro = {
          enable = true,

          attributes = {
            enable = true
          }
        },
        check = {
          command = "clippy",
          extraArgs = {
            "--",
            "-D",
            "clippy::perf",
            "-D",
            "clippy::needless_lifetimes",
            "-D",
            "warnings",
          },

          -- extraEnv = {
          --   CARGO_TARGET_DIR = "target-clippy"
          -- },

          targets = "all",
          features = "all"
        },
        cargo = {
          buildScripts = {
            enable = true,
          },

          extraEnv = {
            CARGO_TARGET_DIR = "target-cargo"
          },

          features = "all"
        },
        diagnostics = {
          enable = false;
        },
        rust = {
          analyzerTargetDir = "target-check"
        },
        rustfmt = {
          extraArgs = {
            "+nightly-2023-07-24"
          }
        }
      }
    }
  },

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

rusttools.setup(opts)

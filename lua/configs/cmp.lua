---------
-- Cmp --
---------
---@diagnostic disable: missing-fields
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',                    -- Snippets
    'onsails/lspkind-nvim',                -- Completion menu icons
    'saadparwaiz1/cmp_luasnip',            -- Snippets
    'hrsh7th/cmp-nvim-lsp',                -- LSP completion
    'hrsh7th/cmp-nvim-lsp-signature-help', -- Signature
    'zjp-CN/nvim-cmp-lsp-rs',              -- Better rust sorting
    -- 'tzachar/cmp-tabnine'                  -- TabNine
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  enabled = function()
    return not vim.opt.diff:get()
  end,
  config = function()
    local visible_buffers = require('utils').visible_buffers
    local noice_is_loaded = require('utils').noice_is_loaded

    local cmp = require('cmp')
    local luasnip = require('luasnip')
    -- Workaround for: https://github.com/hrsh7th/nvim-cmp/issues/1269
    local cmp_insert = { behavior = cmp.SelectBehavior.Select }
    local lspkind = require('lspkind')

    vim.opt.completeopt = 'menu,menuone,noinsert,noselect'

    local sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip', max_item_count = 5 },
      { name = 'path',    option = { trailing_slash = true } },
      {
        name = "lazydev",
        group_index = 0, -- Set group index to 0 to skip loading LuaLS completions
      },
      {
        name = 'buffer',
        max_item_count = 3,
        keyword_length = 2,
        option = {
          get_bufnrs = visible_buffers, -- Suggest words from all visible buffers
          keyword_pattern = [[\k\+]],   -- Support non-ASCII characters
        },
      },
    }
    if not noice_is_loaded() then
      -- Noice has its own signature help
      table.insert(sources, { name = 'nvim_lsp_signature_help' })
    end

    local config_sources = cmp.config.sources(sources)

    -- LSPKind
    lspkind.init({
      symbol_map = require('utils.icons').icons,
    })

    -- Better Rust sorting
    local comparators = require('cmp_lsp_rs').comparators
    for _, source in ipairs(config_sources) do
      require('cmp_lsp_rs').filter_out.entry_filter(source)
    end

    local function get_source_name(entry)
      return entry.source.name and '[' .. entry.source.name .. ']' or ''
    end

    -- Places icon to the left, with margin
    local function cmp_formatting()
      return function(entry, vim_item)
        local format_opts = { mode = 'symbol_text', maxwidth = 50 }
        local kind = lspkind.cmp_format(format_opts)(entry, vim_item)
        local strings = vim.split(kind.kind, '%s', { trimempty = true })

        local show_source_name = false
        local source_name = show_source_name and get_source_name(entry) or ''

        local entry_kind = strings[1] or ''
        local entry_type = strings[2] or ''

        kind.kind = entry_kind
        kind.menu = string.format('  %s  %s', entry_type, source_name)

        -- Don't create duplicates if (snippet) entry already exists
        if entry.source.name == 'nvim_lsp' then
          kind.dup = 0
        end

        return kind
      end
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {

        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },
      sources = config_sources,
      window = {
        completion = {
          col_offset = -2,  -- To fit lspkind icon
          side_padding = 1, -- One character margin
        },
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = cmp_formatting(),
      },
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      sorting = {
        comparators = {
          comparators.inscope_inherent_import,
          comparators.sort_by_label_but_underscore_last,
        },
      },
    })
  end,
}

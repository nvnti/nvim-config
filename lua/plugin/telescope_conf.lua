---------------------------
-- Telescope
---------------------------
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'jvgrootveld/telescope-zoxide' },
    { 'nvim-telescope/telescope-cheat.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-frecency.nvim' },
    { 'nvim-telescope/telescope-dap.nvim' },
    { 'Zane-/cder.nvim' },
    { 'rcarriga/nvim-notify' },
    { 'mfussenegger/nvim-dap' },
    { 'rafi/telescope-thesaurus.nvim' },
    { 'ThePrimeagen/git-worktree.nvim' },
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require('telescope')
    local themes = require('telescope.themes')
    local builtin = require('telescope.builtin')
    local action_state = require('telescope.actions.state')
    local transform_mod = require('telescope.actions.mt').transform_mod

    local feedkeys = require('utils').feedkeys
    local map = require('utils').map
    local append = require('utils').append

    local fn = vim.fn

    local extensions = telescope.extensions

    local fd_ignore_file = fn.expand('$HOME/') .. '.rgignore'
    local cder_dir_cmd = {
      'fd',
      '-t',
      'd',
      '--hidden',
      '--ignore-file',
      fd_ignore_file,
      '.',
    }

    local function multiopen(prompt_bufnr, method)
      local cmd_map = {
        vertical = 'vsplit',
        horizontal = 'split',
        tab = 'tabe',
        default = 'edit',
      }
      local picker = action_state.get_current_picker(prompt_bufnr)
      local multi_selection = picker:get_multi_selection()

      if #multi_selection > 0 then
        require('telescope.pickers').on_close_prompt(prompt_bufnr)
        pcall(vim.api.nvim_set_current_win, picker.original_win_id)

        for i, entry in ipairs(multi_selection) do
          -- opinionated use-case
          local cmd = i == 1 and 'edit' or cmd_map[method]
          vim.cmd(string.format('%s %s', cmd, entry.value))
        end
      else
        actions['select_' .. method](prompt_bufnr)
      end
    end

    local custom_actions = transform_mod({
      multi_selection_open_vertical = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'vertical')
      end,
      multi_selection_open_horizontal = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'horizontal')
      end,
      multi_selection_open_tab = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'tab')
      end,
      multi_selection_open = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'default')
      end,
    })

    local function stopinsert(callback)
      return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
          callback(prompt_bufnr)
        end)
      end
    end

    local multi_open_mappings = {
      i = {
        ['<C-v>'] = stopinsert(custom_actions.multi_selection_open_vertical),
        ['<C-s>'] = stopinsert(custom_actions.multi_selection_open_horizontal),
        ['<C-t>'] = stopinsert(custom_actions.multi_selection_open_tab),
        ['<CR>']  = stopinsert(custom_actions.multi_selection_open),
      },
      n = {
        ['<C-v>'] = custom_actions.multi_selection_open_vertical,
        ['<C-s>'] = custom_actions.multi_selection_open_horizontal,
        ['<C-t>'] = custom_actions.multi_selection_open_tab,
        ['<CR>']  = custom_actions.multi_selection_open,
      },
    }

    -- Don't show line text, just the file name
    local horizontal_picker = { show_line = false }

    local dropdown_picker = themes.get_dropdown({
      show_line = false,
      layout_config = { mirror = true },
    })

    local cursor_picker = themes.get_cursor({ show_line = false })

    -- Zoxide
    require('telescope._extensions.zoxide.config').setup({})

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = "close",
          },
          n = {
            ["<space>ca"] = actions.send_to_qflist,
          },
        },
        layout_config = {
          width = 0.9,
          height = 0.6,
          horizontal = {
            preview_width = 80,
          },
        },
        dynamic_preview_title = true,
        selection_caret = '▶ ',
        multi_icon = '',
        path_display = { 'truncate' },
        prompt_prefix = '   ',
        no_ignore = true,
        file_ignore_patterns = {
          '%.git/', 'node_modules/', '%.npm/', '__pycache__/', '%[Cc]ache/',
          '%.dropbox/', '%.dropbox_trashed/', '%.local/share/Trash/',
          '%.py[c]', '%.sw.?', '~$', '%.tags', '%.gemtags', '%.tmp',
          '%.plist$', '%.pdf$', '%.jpg$', '%.JPG$', '%.jpeg$', '%.png$',
          '%.class$', '%.pdb$', '%.dll$',
        },
      },
      pickers = {
        find_files                = {
          mappings = multi_open_mappings,
          find_command = {
            'fd',
            '--type',
            'f',
            '--no-ignore-vcs',
            '--color=never',
            '--hidden',
            '--follow',
          },
        },
        oldfiles                  = { mappings = multi_open_mappings },
        current_buffer_fuzzy_find = { sorting_strategy = 'ascending' },
        quickfix                  = horizontal_picker,
        tagstack                  = horizontal_picker,
        jumplist                  = horizontal_picker,
        lsp_references            = horizontal_picker,
        lsp_definitions           = dropdown_picker,
        lsp_type_definitions      = dropdown_picker,
        lsp_implementations       = dropdown_picker,
        buffers                   = dropdown_picker,
        spell_suggest             = cursor_picker,
      },
      extensions = {
        sessions_picker = {
          sessions_dir = vim.fn.stdpath('data') .. '/sessions/',
        },
        cder = {
          previewer_command = 'exa '
              .. '--color=always '
              .. '-T '
              .. '--level=2 '
              .. '--icons '
              .. '--git-ignore '
              .. '--git '
              .. '--ignore-glob=.git',
          dir_command = cder_dir_cmd,
        },
        zoxide = {
          prompt_title = 'Zoxide',
          verbose = false,
        },
        frecency = {
          db_safe_mode = false, -- Never ask for confirmation clean up DB
        },
      },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '-u', -- thats the new thing
      },
    }

    telescope.load_extension('zoxide')
    telescope.load_extension('fzf')
    telescope.load_extension('frecency')
    telescope.load_extension('cheat')
    telescope.load_extension('notify')
    telescope.load_extension('cder')
    telescope.load_extension('git_worktree')

    local function telescope_markdowns()
      builtin.find_files({
        search_dirs = { '$MARKDOWNS' },
        prompt_title = 'Markdowns',
        path_display = function(_, path)
          local relative_path, _ = path:gsub(vim.fn.expand('$MARKDOWNS'), '')
          return relative_path
        end,
      })
    end

    local function telescope_config()
      builtin.find_files({
        search_dirs = { '$HOME/.config/nvim/' },
        prompt_title = 'Neovim config',
        no_ignore = true,
        hidden = true,
        path_display = function(_, path)
          local relative_path, _ = path:gsub(vim.fn.expand('$HOME/.config/nvim/'), '')
          return relative_path
        end,
      })
    end

    local function grep_string()
      vim.g.grep_string_mode = true
      vim.ui.input({ prompt = 'Grep string', default = fn.expand("<cword>") },
        function(value)
          if value ~= nil then
            require('telescope.builtin').grep_string({ search = value })
          end
          vim.g.grep_string_mode = false
        end)
    end

    -- TODO: lazy load mappings with lazy.nvim
    map('n', '<C-p>', function()
      return builtin.find_files({ hidden = true })
    end, 'Find files')
    map({ 'n', 'x' }, '<leader>/', grep_string, 'Grep string')

    map('n', '<leader>F', builtin.live_grep, 'Live grep')
    map('n', '<leader>B', builtin.buffers, 'Open buffers')
    map('n', '<leader>to', builtin.oldfiles, 'Recently used files')
    map('n', '<leader>m', extensions.frecency.frecency, 'Frecency')
    map('n', '<leader>h', builtin.help_tags, 'Help tags')
    map('n', '<leader>tt', builtin.builtin, 'Builtin telescope commands')
    map('n', '<leader>tH', builtin.highlights, 'Highlights')
    map('n', '<leader>tc', builtin.commands, 'Commands')
    map('n', '<leader>tm', builtin.keymaps, 'Keymaps')
    map('n', '<leader>t/', builtin.search_history, 'Search history')
    map('n', '<leader>tD', builtin.diagnostics, 'Diagnostics')
    map('n', '<leader>t?', builtin.current_buffer_fuzzy_find, 'Fuzzy find in buffer')
    map('n', '<leader>tq', builtin.quickfix, 'Quickfix')
    map('n', '<leader>tQ', builtin.quickfixhistory, 'Quickfix history')
    map('n', '<leader>tr', builtin.resume, 'Resume latest telescope session')
    map('n', '<leader>tg', builtin.git_files, 'Find git files')
    map('n', 'sp', builtin.spell_suggest, 'Spell suggestions')

    map('n', 'cd', extensions.cder.cder, 'Change directory')
    map('n', 'cD', function()
      return extensions.cder.cder({
        dir_command = append(cder_dir_cmd, vim.env.HOME),
        prompt_title = 'Change Directory',
      })
    end, 'Change directory (from home directory)')
    map('n', '<M-z>', extensions.zoxide.list, 'Change directory with zoxide')
    map('n', '<leader>tC', function() return extensions.cheat.fd({}) end, 'Cheat.sh')
    map('n', '<leader>M', telescope_markdowns, 'Markdowns')
    map('n', '<leader>n', telescope_config, 'Neovim config')
    map('n', '<leader>tn', extensions.notify.notify, 'Notifications')

    if not vim.opt.diff:get() then
      map('n', '<leader>td', extensions.dap.commands)
      map('n', '<leader>tb', extensions.dap.list_breakpoints)
      map('n', '<leader>tv', extensions.dap.variables)
      map('n', '<leader>tf', extensions.dap.frames)
    end

    map('n', '<leader>tT', '<cmd>Telescope thesaurus lookup<CR>', 'Thesaurus')

    -- Temporary workaround for https://github.com/nvim-telescope/telescope.nvim/issues/2766
    vim.api.nvim_create_autocmd('WinLeave', {
      callback = function()
        if vim.bo.ft == 'TelescopePrompt' and vim.fn.mode() == 'i' then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, false, true), 'i',
            false)
        end
      end,
    })
  end,
}

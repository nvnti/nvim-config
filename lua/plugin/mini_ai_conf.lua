---------------------------
-- Mini AI
---------------------------
return {
  'echasnovski/mini.ai',
  dependencies = {
    'tpope/vim-repeat',
    'nvim-treesitter/nvim-treesitter',
  },
  version = '*',
  event = 'VeryLazy',
  config = function()
    local gen_spec = require('mini.ai').gen_spec
    local spec_pair = gen_spec.pair

    local function pair(left, right)
      if right == nil then
        right = left
      end

      return spec_pair(left, right, { type = 'balanced' })
    end

    require('mini.ai').setup({
      verbose = false,
    })
  end,
}


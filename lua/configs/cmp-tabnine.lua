-------------
-- Tabnine --
-------------
return {
  'tzachar/cmp-tabnine',
  dependencies = 'hrsh7th/nvim-cmp',
  event = { 'InsertEnter' },
  build = './install.sh',
  config = function()
    local tabnine = require('cmp_tabnine.config')
    tabnine:setup({
      max_num_results = 3,
      show_prediction_strength = true,
      ignored_file_types = {},
      max_lines = 500,
    })
  end
}

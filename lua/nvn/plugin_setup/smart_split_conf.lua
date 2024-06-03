local M = {}

function M.fn()
  -- resizing splits
  -- amount defaults to 3 if not specified
  -- use absolute values, no + or -
  -- the functions also check for a range,
  -- so for example if you bind `<A-h>` to `resize_left`,
  -- then `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
  require('smart-splits').resize_up(amount)
  require('smart-splits').resize_down(amount)
  require('smart-splits').resize_left(amount)
  require('smart-splits').resize_right(amount)
  -- moving between splits
  -- pass same_row as a boolean to override the default
  -- for the move_cursor_same_row config option.
  -- See Configuration.
  require('smart-splits').move_cursor_up()
  require('smart-splits').move_cursor_down()
  require('smart-splits').move_cursor_left(same_row)
  require('smart-splits').move_cursor_right(same_row)
  -- Swapping buffers directionally with the window to the specified direction
  require('smart-splits').swap_buf_up()
  require('smart-splits').swap_buf_down()
  require('smart-splits').swap_buf_left()
  require('smart-splits').swap_buf_right()
  -- the buffer swap functions can also take an `opts` table to override the
  -- default behavior of whether or not the cursor follows the buffer
  require('smart-splits').swap_buf_right({ move_cursor = true })
  -- persistent resize mode
  -- temporarily remap your configured resize keys to
  -- smart resize left, down, up, and right, respectively,
  -- press <ESC> to stop resize mode (unless you've set a different key in config)
  -- resize keys also accept a range, e.e. pressing `5j` will resize down 5 times the default_amount


  -- require('smart-splits').start_resize_mode()

  -- recommended mappings
  -- resizing splits
  -- these keymaps will also accept a range,
  -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
  vim.keymap.set('n', '<SPACE>bh', require('smart-splits').resize_left)
  vim.keymap.set('n', '<SPACE>bj', require('smart-splits').resize_down)
  vim.keymap.set('n', '<SPACE>bk', require('smart-splits').resize_up)
  vim.keymap.set('n', '<SPACE>bl', require('smart-splits').resize_right)
  -- moving between splits
  vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
  vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
  vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
  vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
  -- swapping buffers between windows
  vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
  vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
  vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
  vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
end

return M

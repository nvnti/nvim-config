----------------
-- Rust fmt
----------------
return {
  "rust-lang/rust.vim",
  enabled = function()
    return not vim.opt.diff:get()
  end,
  config = function()
    vim.g.rustfmt_autosave = 0
  end,
}

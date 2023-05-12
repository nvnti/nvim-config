local terminal  = require('toggleterm.terminal').Terminal

local M = {}

local cfmt = terminal:new({
  cmd = "cargo +nightly fmt --all -- --check 2>&1 | tee .nvim_cargo_fmt_check.txt",
  hidden = true,
  close_on_exit = true,
  shell = "zsh",
  direction = 'vertical',
})

local update_fmt = terminal:new({
  cmd = "cargo +nightly fmt --all 2>&1 | tee .nvim_cargo_fmt_update.txt",
  hidden = true,
  close_on_exit = true,
  shell = "zsh",
  direction = 'vertical',
})

local cclippy = terminal:new({
  cmd = "cargo check_clippy 2>&1 | tee .nvim_cargo_clippy.txt",
  hidden = true,
  close_on_exit = true,
  shell = "zsh",
  direction = 'vertical',
})

local cargo_test = terminal:new({
  cmd = "cargo test --workspace --features dev 2>&1 | tee .nvim_cargo_test.txt",
  hidden = true,
  close_on_exit = true,
  shell = "zsh",
  direction = 'vertical',
})

local cargo_build = terminal:new({
  cmd = "cargo build --workspace --features dev 2>&1 | tee .nvim_cargo_build.txt",
  hidden = true,
  close_on_exit = true,
  shell = "zsh",
  direction = 'vertical',
})

local lazygit = terminal:new({
  cmd = "lazygit",
  hidden = true,
  close_on_exit = true,
  direction = "float"
})

local htop = terminal:new({
  cmd = "htop",
  hidden = true,
  close_on_exit = true,
  direction = "float"
})

function M.cargo_build()
  cargo_build:toggle()
end

function M.cargo_test()
  cargo_test:toggle()
end

function M.cfmt_toggle()
  cfmt:toggle()
end

function M.cfmt_update_toggle()
  update_fmt:toggle()
end

function M.cclippy_toggle()
  cclippy:toggle()
end

function M.lazygit_toggle()
  lazygit:toggle()
end

function M.htop_toggle()
  htop:toggle()
end

function M.load_clippy_errors()
  vim.cmd("cfile .nvim_cargo_clippy.txt");
end

function M.load_cargo_build_errors()
  vim.cmd("cfile .nvim_cargo_build.txt");
end

function M.load_cargo_test_errors()
  vim.cmd("cfile .nvim_cargo_test.txt");
end

return M

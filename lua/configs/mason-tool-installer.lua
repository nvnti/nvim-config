--------------------------
-- Mason Tool Installer --
--------------------------
return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  enabled = function()
    return not vim.opt.diff:get()
  end,
  opts = {
    ensure_installed = {
      'prettier',
      'vacuum',
      'zk',
      'codelldb', -- Used by rustaceanvim
      'vimls',
      'lemminx',
      'js-debug-adapter',
      'go-debug-adapter',
      'bash-debug-adapter',
      'rust-analyzer',
    },
  },
}

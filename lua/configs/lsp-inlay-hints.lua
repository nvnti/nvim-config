---------------------
-- LSP Inlay Hints --
---------------------
return {
  'lvimuser/lsp-inlayhints.nvim',
  branch = 'anticonceal',
  event = 'LspAttach',
  enabled = function()
    return not vim.opt.diff:get()
  end,
  opts = {
    inlay_hints = {
      parameter_hints = {
        remove_colon_start = false,
      },
      type_hints = {
        remove_colon_start = false,
        remove_colon_end = false,
      },
    },
  },
}

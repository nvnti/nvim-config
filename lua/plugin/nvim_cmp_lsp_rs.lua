---------------------------
-- CMP LSP RS
---------------------------
return {
      'zjp-CN/nvim-cmp-lsp-rs',
      dependencies = 'hrsh7th/nvim-cmp',
      ft = 'rust',
      opts = {},
      enabled = function()
            return not vim.opt.diff:get()
      end,
}

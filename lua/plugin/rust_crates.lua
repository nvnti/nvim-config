return {
    'saecki/crates.nvim',
    tag = 'stable',
    enabled = function()
        return not vim.opt.diff:get()
    end,
    config = function()
        require("crates").setup {
            completion = {
                cmp = {
                    enabled = true,
                },
            },
            lsp = {
                enabled = true,
                on_attach = function(client, bufnr)
                    -- the same on_attach function as for your other lsp's
                end,
                actions = true,
                completion = true,
                hover = true,
            },
        }
    end,
}

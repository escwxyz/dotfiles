--- Linter & Formatter & Completion
--- ~~~~~~~~~~~~~~~~~~
--- https://github.com/jose-elias-alvarez/null-ls.nvim

return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            on_attach = require("configs.plugins.lsp.on_attach").on_attach,
            debounce = 150,
            save_after_format = false,
            sources = {
                -- null_ls.builtins.completion.luasnip,
                null_ls.builtins.formatting.stylua.with({
                    extra_args = {
                        "--indent-type", "Spaces",
                        "--column-width", "100",
                    }
                }),
                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html" },
                    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--print-width 100" },
                }),
                null_ls.builtins.formatting.rustfmt.with({
                    extra_args = { "--edition=2021" }
                }),
                require("typescript.extensions.null-ls.code-actions"),
            },
        })

    end
}

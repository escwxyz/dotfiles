local M = {}

M.on_attach = function(client, bufnr)
    if vim.g.FormatOnSave and client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LSPFormat", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end

    if not vim.g.FormatOnSave then
        vim.keymap.set("n", "<BS>", function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end, { desc = "[LSP] Format file", buffer = bufnr })
    end
end

M.setup = function()
    local null_ls = require("null-ls")
    null_ls.setup({
        on_attach = M.on_attach,
        sources = {
            null_ls.builtins.formatting.stylua.with({
                extra_args = {
                    "--indent-type",
                    "Spaces",
                    "--column-width",
                    "100",
                },
            }),
            null_ls.builtins.formatting.prettierd.with({
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "css",
                    "html",
                },
                extra_args = {
                    "--no-semi",
                    "--single-quote",
                    "--jsx-single-quote",
                    "--print-width 100",
                },
            }),
            null_ls.builtins.formatting.rustfmt.with({
                extra_args = { "--edition=2021" },
            }),
        },
    })
end

return M

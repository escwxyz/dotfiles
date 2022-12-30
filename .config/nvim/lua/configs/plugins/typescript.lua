return {
    "jose-elias-alvarez/typescript.nvim",
    ft = "typescript",
    config = function()
        require("typescript").setup({
            disable_commands = false, -- prevent the plugin from creating Vim commands
            debug = false, -- enable debug logging for commands
            go_to_source_definition = {
                fallback = true, -- fall back to standard LSP definition on failure
            },
            server = { -- pass options to lspconfig's setup method
                capabilities = require("configs.plugins.lsp.cap").cap,
                on_attach = function(_, bufnr)
                    require("configs.plugins.lsp.on_attach").on_attach(_, bufnr)
                    -- TODO
                    -- vim.keymap.set({ "n", "i" }, "<A-i>", "<cmd>:TypescriptAddMissingImports<CR>",
                    --     { silent = true, buffer = bufnr })
                    -- vim.keymap.set({ "n", "i" }, "<A-o>", "<cmd>:TypescriptOrganizeImports<CR>",
                    --     { silent = true, buffer = bufnr })


                end
            },
        })
    end
}

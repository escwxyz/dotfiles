local M = {}

M.setup = function()
    require("typescript").setup({
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
            fallback = true,
        },
        server = {
            capabilities = require("plugins.lsp.capabilities"),
            on_attach = function(_, bufnr)
                require("plugins.lsp.on_attach")(_, bufnr)
                vim.keymap.set(
                    "n",
                    "<leader>aa",
                    "<cmd>TypescriptAddMissingImports<CR>",
                    { desc = "[TS] Add missing imports", buffer = bufnr }
                )
                vim.keymap.set(
                    "n",
                    "<leader>ao",
                    "<cmd>TypescriptOrganizeImports<CR>",
                    { desc = "[TS] Organize imports", buffer = bufnr }
                )
                vim.keymap.set(
                    "n",
                    "<leader>ar",
                    "<cmd>TypescriptRemoveUnused<CR>",
                    { desc = "[TS] Remove unused", buffer = bufnr }
                )
                vim.keymap.set(
                    "n",
                    "<leader>af",
                    "<cmd>TypescriptFixAll<CR>",
                    { desc = "[TS] Fix all", buffer = bufnr }
                )
            end,
        },
    })
end

return M

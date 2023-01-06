local M = {}

local capabilities = require("lsp.lsp_config").capabilities

local on_attach = require("lsp.lsp_config").on_attach

M.setup = function()
    require("typescript").setup({
        disable_commands = false,
        debug = true,
        go_to_source_definition = {
            fallback = true,
        },
        server = {
            capabilities = capabilities,
            on_attach = function(_, bufnr)
                on_attach(_, bufnr)

                require("which-key").register({
                    i = {
                        name = "imports",
                        a = { "<cmd>TypescriptAddMissingImports<CR>", "add missing imports" },
                        o = { "<cmd>TypescriptOrganizeImports<CR>", "organize imports" }
                    },
                    f = { "<cmd>TypescriptFixAll<CR>", "fix all" },
                    r = { "<cmd>TypescriptRenameFile<CR>", "rename" },
                    s = { "<cmd>TypescriptGoToSourceDefinition<CR>", "source definition" },
                    u = { "<cmd>TypescriptRemoveUnused<CR>", "remove unused" }
                }, { prefix = "<A>", buffer = bufnr })

            end
        },
    })
end

return M

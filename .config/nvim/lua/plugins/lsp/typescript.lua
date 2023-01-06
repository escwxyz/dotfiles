local M = {}

local capabilities = require("plugins.lsp.lsp_config").capabilities

local on_attach = require("plugins.lsp.lsp_config").on_attach

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
                require("caskey").emit("TSServerAttached", bufnr)
            end,
        },
    })
end

return M

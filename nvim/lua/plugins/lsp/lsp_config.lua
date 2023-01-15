local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local signs = require("configs.icons").diagnostic_icons

local navic = require("nvim-navic")

local define_diagnostics = function()
    vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

local on_attach = function(client, bufnr)
    --	require("caskey").emit("LspAttach")
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- This requires telescope to be loaded
    -- vim.keymap.set("n", "gr", require("goto-preview").goto_preview_references, { silent = true, buffer = bufnr })

    -- vim.keymap.set("n", "rr", function(
    --     if client.server_capabilities.renameProvider ~= nil then
    --         return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
    --     else
    --         vim.lsp.buf.rename()
    --     end
    -- end, { silent = true, buffer = bufnr })
end

M.setup = function()
    define_diagnostics()
    require("neodev").setup({
        library = {
            plugins = false, --NOTE disable indexing all plugins
        },
    })
    require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
    })
    -- TODO the hint is overlapped by cmp menu
    require("lsp_signature").setup({
        bind = true,
        noice = true,
    })
    require("lspconfig")["sumneko_lua"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim", "awesome", "client" } },
                telemetry = { enable = false },
                format = { enable = false },
                completion = { callSnippet = "Replace" },
                workspace = {
                    library = { vim.api.nvim_get_runtime_file("", true), "/usr/share/awesome/lib" },
                    checkThirdParty = false,
                },
            },
        },
    })
end

M.capabilities = capabilities

M.on_attach = on_attach

return M
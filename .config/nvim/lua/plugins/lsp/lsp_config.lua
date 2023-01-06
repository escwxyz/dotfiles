local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- this capability is for fold/unfold
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local signs = require("configs.icons").diagnostic_icons

local wk = require("which-key")

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, { silent = true, desc = "[LSP] Hover", buffer = bufnr })

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev({})
    end, { desc = "[LSP] Prev diagnostic", silent = true, buffer = bufnr })

    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next({})
    end, { desc = "[LSP] Next diagnostic", silent = true, buffer = bufnr })

    vim.keymap.set("n", "ff", function()
        vim.lsp.buf.format()
    end, { desc = "[LSP] Format", silent = true, buffer = bufnr })

    wk.register({
        g = {
            name = "goto",

            d = {
                function()
                    require("goto-preview").goto_preview_definition()
                end,
                "definition",
            },
            t = {
                function()
                    require("goto-preview").goto_preview_type_definition()
                end,
                "type definition",
            },
            i = {
                function()
                    require("goto-preview").goto_preview_implementation()
                end,
                "implementation",
            },
            q = {
                function()
                    require("goto-preview").close_all_win()
                end,
                "close all goto windows",
            },
        },
    }, { buffer = bufnr })

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
                diagnostics = { globals = { "vim" } },
                telemetry = { enable = false },
                format = { enable = false },
                completion = { callSnippet = "Replace" },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
        },
    })
end

M.capabilities = capabilities

M.on_attach = on_attach

return M

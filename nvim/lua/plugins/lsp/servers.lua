local M = {}

local function get_library()
    local lib = {
        vim.api.nvim_get_runtime_file("", true),
    }
    -- TODO
    if vim.fn.has("mac") > 0 then
        local hammerspoon =
            string.format("%s/.hammerspoon/Spoons/EmmyLua.spoon/annotations", os.getenv("HOME"))
        table.insert(lib, hammerspoon)
    end

    return lib
end

M.setup_lua = function()
    require("lspconfig").lua_ls.setup({
        on_attach = require("plugins.lsp.on_attach"),
        capabilities = require("plugins.lsp.capabilities"),
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim", "awesome", "client" } },
                telemetry = { enable = false },
                format = { enable = false },
                completion = { callSnippet = "Replace" },
                workspace = {
                    library = get_library(),
                    checkThirdParty = false,
                },
            },
        },
    })
end

M.setup_rust = function()
    require("lspconfig").rust_analyzer.setup({
        on_attach = require("plugins.lsp.on_attach"),
        capabilities = require("plugins.lsp.capabilities"),
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    })
end

M.setup_pinyin = function()
    require("lspconfig").ds_pinyin_lsp.setup({
        init_options = {
            db_path = vim.fn.stdpath("config") .. "/dict.db3",
        },
    })
end

M.setup_tailwindcss = function()
    require("lspconfig").tailwindcss.setup({
        on_attach = require("plugins.lsp.on_attach"),
        capabilities = require("plugins.lsp.capabilities"),
    })
end

return M

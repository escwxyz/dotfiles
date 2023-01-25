local function get_library()
    local lib = {
        vim.api.nvim_get_runtime_file("", true),
    }
    if vim.fn.has("mac") > 0 then
        local hammerspoon =
            string.format("%s/.hammerspoon/Spoons/EmmyLua.spoon/annotations", os.getenv("HOME"))
        table.insert(lib, hammerspoon)
    end

    return lib
end

local M = {
    "neovim/nvim-lspconfig",
    enabled = true,
    event = "BufReadPre", -- NOTE improper event leading to unexpected behavior
    -- ft = {
    --     "rust",
    --     "lua",
    --     "typescript",
    --     "tsx",
    --     "typescriptreact",
    --     "dart",
    --     "javascript",
    --     "css",
    -- },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "smjonas/inc-rename.nvim",
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
                })
            end,
        },
        {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup({
                    library = {
                        plugins = false,
                    },
                })
            end,
        },
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("lsp_signature").setup({
                    bind = true,
                    noice = true,
                })
            end,
        },
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("plugins.lsp.diagnostics").define_diagnostics()
        require("lspconfig").sumneko_lua.setup({
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
    end,
}

return M

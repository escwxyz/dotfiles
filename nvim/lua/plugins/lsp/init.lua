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

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border }
    ),
}

local M = {
    "neovim/nvim-lspconfig",
    enabled = true,
    event = "BufReadPre", -- NOTE improper event leading to unexpected behavior
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
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
        -- {
        --     -- config = function()
        --     --     require("lsp-inlayhints").setup({
        --     --         inlay_hints = {
        --     --             parameter_hints = {
        --     --                 show = false,
        --     --             },
        --     --         },
        --     --     })
        --     -- end,
        -- },
    },
    config = function()
        require("plugins.lsp.diagnostics").define_diagnostics()
        require("lspconfig").tailwindcss.setup({
            on_attach = require("plugins.lsp.on_attach"),
            capabilities = require("plugins.lsp.capabilities"),
            handlers = handlers,
        })
        require("lspconfig").sumneko_lua.setup({
            on_attach = require("plugins.lsp.on_attach"),
            capabilities = require("plugins.lsp.capabilities"),
            handlers = handlers,
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

        require("lspconfig").ds_pinyin_lsp.setup({
            init_options = {
                db_path = vim.fn.stdpath("config") .. "/dict.db3",
            },
        })
        require("lspconfig").rust_analyzer.setup({
            on_attach = require("plugins.lsp.on_attach"),
            capabilities = require("plugins.lsp.capabilities"),
            handlers = handlers,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        })
    end,
}

return M

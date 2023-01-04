return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre", -- NOTE improper event leading to unexpected behavior
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "smjonas/inc-rename.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim"
    },
    config = function()

        require("neodev").setup()

        require("mason-lspconfig").setup({
            ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
        })

        require("lspconfig")["sumneko_lua"].setup({
            on_attach = require("utils.on_attach").on_attach,
            capabilities = require("utils.capabilities").capabilities,
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
}

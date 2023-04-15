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

local M = {
    "neovim/nvim-lspconfig",
    enabled = true,
    event = "BufEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = { "rust_analyzer", "tsserver" },
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
    },
    config = function()
        vim.lsp.handlers["textDocument/hover"] =
            vim.lsp.with(vim.lsp.handlers.hover, { border = border })

        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

        require("plugins.lsp.diagnostics").define_diagnostics()
        require("plugins.lsp.servers").setup_lua()
        require("plugins.lsp.servers").setup_rust()
        require("plugins.lsp.servers").setup_pinyin()
        require("plugins.lsp.servers").setup_tailwindcss()
    end,
}

return M

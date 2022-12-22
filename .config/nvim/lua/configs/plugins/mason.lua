--- LSP package manager
--- ~~~~~~~~~~~~~~~~~~~
--- https://github.com/williamboman/mason.nvim

local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "sumneko_lua",
                "rust_analyzer",
                "tsserver",
                "eslint",
            },
            automatic_installation = true,
        })
    end
}

return M

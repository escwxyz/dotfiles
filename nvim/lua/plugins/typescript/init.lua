return {
    "jose-elias-alvarez/typescript.nvim",
    enabled = true,
    ft = { "typescript", "javascript", "typescriptreact" },
    config = function()
        require("plugins.typescript.config").setup()
    end
}

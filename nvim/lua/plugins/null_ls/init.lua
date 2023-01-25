return {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("plugins.null_ls.config").setup()
    end
}

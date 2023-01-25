return {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("plugins.gitsigns.config").setup()
    end
}

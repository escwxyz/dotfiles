return {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = function()
        require("plugins.oil.config").setup()
    end,
}

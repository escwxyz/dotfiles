return {
    "abecodes/tabout.nvim",
    event = "VeryLazy",
    config = function()
        require("plugins.tabout.config").setup()
    end,
}

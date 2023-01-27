return {
    "m-demare/hlargs.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("plugins.hlargs.config").setup()
    end,
}

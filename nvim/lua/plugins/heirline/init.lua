return {
    "rebelot/heirline.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("plugins.heirline.config").setup()
    end,
}

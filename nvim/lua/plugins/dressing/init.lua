return {
    "stevearc/dressing.nvim",
    enabled = true,
    lazy = false,
    config = function()
        require("plugins.dressing.config").setup()
    end
}

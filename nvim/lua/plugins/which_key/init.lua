return {
    "folke/which-key.nvim",
    enabled = true,
    lazy = false,
    config = function()
        require("plugins.which_key.config").setup()
    end
}

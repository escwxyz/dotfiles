return {
    "folke/zen-mode.nvim",
    enabled = true,
    cmd = { "ZenMode" },
    config = function()
        require("plugins.zen_mode.config").setup()
    end
}

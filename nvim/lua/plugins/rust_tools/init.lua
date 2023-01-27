return {
    "simrat39/rust-tools.nvim",
    enabled = true,
    ft = "rust",
    config = function()
        require("plugins.rust_tools.config").setup()
    end,
}

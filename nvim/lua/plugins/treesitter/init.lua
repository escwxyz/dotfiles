return {
    "nvim-treesitter/nvim-treesitter",
    dev = false,
    enabled = true,
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
        require("plugins.treesitter.config").setup()
    end
}

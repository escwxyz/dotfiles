return {
    "saecki/crates.nvim",
    ft = "toml",--TODO
    config = function()
        require("crates").setup()
    end,
}

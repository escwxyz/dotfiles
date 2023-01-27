return {
    "saecki/crates.nvim",
    enabled = true,
    event = "BufReadPost Cargo.toml",
    config = function()
        require("plugins.crates.config").setup()
        require("plugins.crates.config").setup_cmds()
    end,
}

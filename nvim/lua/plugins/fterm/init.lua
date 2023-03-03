return {
    "numToStr/FTerm.nvim",
    enabled = true,
    cmd = { "Lazygit", "FTermToggle" },
    config = function()
        require("plugins.fterm.config").setup()
        require("plugins.fterm.config").setup_cmds()
        require("plugins.fterm.config").setup_terminals()
    end,
}

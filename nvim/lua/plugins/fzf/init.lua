return {
    "ibhagwan/fzf-lua",
    commit = "c25c3f210670b5539ccff527e9702127d27cc322",
    enabled = true,
    cmd = { "FzfLua", "FindProjects", "FindCommands" },
    config = function()
        require("plugins.fzf.config").setup()
        require("plugins.fzf.config").setup_cmds()
    end,
}

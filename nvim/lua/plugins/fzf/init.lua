return {
    "ibhagwan/fzf-lua",
    enabled = true,
    cmd = { "FzfLua", "FindProjects", "FindCommands" },
    config = function()
        require("plugins.fzf.config").setup()
        require("plugins.fzf.config").setup_cmds()
    end,
}

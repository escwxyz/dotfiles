return {
    "ibhagwan/fzf-lua",
    enabled = true,
    cmd = { "FzfLua", "FindProjects" },
    config = function()
        require("plugins.fzf.config").setup()
        require("plugins.fzf.config").setup_cmds()
    end
}

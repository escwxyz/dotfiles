return {
    "kevinhwang91/nvim-ufo",
    enabled = true,
    dependencies = { "kevinhwang91/promise-async" },
    cmd = { "UFOOpenAllFolds", "UFOCloseAllFolds" },
    config = function()
        require("plugins.ufo.config").setup()
        require("plugins.ufo.config").setup_cmds()
    end
}

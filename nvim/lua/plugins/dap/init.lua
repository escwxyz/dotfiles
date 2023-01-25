return {
    "mfussenegger/nvim-dap",
    enabled = true,
    dependencies = {
        { "rcarriga/nvim-dap-ui" },
        { "theHamsta/nvim-dap-virtual-text" },
    },
    cmd = {
        "DAPToggleBreakpoint", "DAPContinue", "DAPStepOver", "DAPStepInto"
    },
    config = function()
        require("plugins.dap.config").setup()
        require("plugins.dap.config").setup_cmds()
    end
}

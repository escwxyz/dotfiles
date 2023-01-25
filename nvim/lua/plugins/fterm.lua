-- TODO allow to know the terminal is still active when is closed(hidden)
local opts = {
    ft = "FTerm",
    border = "rounded",
    hl = "Normal",
    blend = 10,
    dimensions = {
        height = 0.8, -- Height of the terminal window
        width = 0.8, -- Width of the terminal window
        x = 0.5, -- X axis of the terminal window
        y = 0.5, -- Y axis of the terminal window
    },
    clear_env = false,
    env = nil,
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_exit = nil,
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stdout = nil,
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stderr = nil,
}

return {
    "numToStr/FTerm.nvim",
    enabled = true,
    cmd = { "OpenTerminal" },
    config = function()
        require("FTerm").setup(opts)
        vim.api.nvim_create_user_command("OpenTerminal", require("FTerm").open, {})
        vim.api.nvim_create_user_command("CloseTerminal", require("FTerm").close, {})
        vim.api.nvim_create_user_command("ExitTerminal", require("FTerm").exit, {})
    end
}

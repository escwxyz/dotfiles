-- TODO allow to know the terminal is still active when is closed(hidden)

local M = {}

M.setup = function()
    require("FTerm").setup({
        ---Filetype of the terminal buffer
        ---@type string
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
        ---Callback invoked when the terminal exits.
        ---See `:h jobstart-options`
        ---@type fun()|nil
        on_exit = nil,

        ---Callback invoked when the terminal emits stdout data.
        ---See `:h jobstart-options`
        ---@type fun()|nil
        on_stdout = nil,

        ---Callback invoked when the terminal emits stderr data.
        ---See `:h jobstart-options`
        ---@type fun()|nil
        on_stderr = nil,
    })
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("OpenTerminal", require("FTerm").open, { bang = true })
    vim.api.nvim_create_user_command("CloseTerminal", require("FTerm").close, { bang = true })
    vim.api.nvim_create_user_command("ExitTerminal", require("FTerm").exit, { bang = true })
end

M.setup_terminals = function()
    require("plugins.nnn").setup()
    require("plugins.git.gitui").setup()
end

return M

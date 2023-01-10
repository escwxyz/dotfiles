local M = {}

M.setup = function()
    require("FTerm").setup({
        ---Filetype of the terminal buffer
        ---@type string
        ft = "FTerm",

        ---Command to run inside the terminal
        ---NOTE: if given string[], it will skip the shell and directly executes the command
        ---@type fun():(string|string[])|string|string[]
        cmd = os.getenv("SHELL"),
        border = "rounded",

        ---Close the terminal as soon as shell/command exits.
        ---Disabling this will mimic the native terminal behaviour.
        ---@type boolean
        auto_close = true,

        ---Highlight group for the terminal. See `:h winhl`
        ---@type string
        hl = "Normal",
        -- Transparency (0 - 100)
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

M.open_terminal = function()
    require("FTerm").open()
end

M.close_terminal = function()
    require("FTerm").close()
end
M.exit_terminal = function()
    require("FTerm").exit()
end
M.toggle_terminal = function()
    require("FTerm").toggle()
end

M.new = function(options)
    local fterm = require("FTerm")
    return fterm:new({
        ft = options.ft or "terminal",
        cmd = options.cmd,
        blend = 10,
        border = "rounded",
        dimensions = {
            height = 0.8,
            width = 0.8,
        },
    })
end

return M

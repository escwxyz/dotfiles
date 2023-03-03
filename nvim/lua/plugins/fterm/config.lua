local M = {}

M.setup = function()
    require("FTerm").setup({
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
    })
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("FTermToggle", function()
        require("FTerm").toggle()
    end, {})
end

M.setup_terminals = function()
    local fterm = require("FTerm")

    local lazygit = fterm:new({
        ft = "Lazygit",
        cmd = "lazygit",
        border = "rounded",
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    })

    vim.api.nvim_create_user_command("Lazygit", function()
        lazygit:toggle()
    end, {})
end

return M

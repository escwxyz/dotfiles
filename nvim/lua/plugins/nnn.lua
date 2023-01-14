local M = {}

local fterm = require("FTerm")

local nnn = fterm:new({
    ft = "nnn",
    cmd = "nnn -de",
    border = "rounded",
    blend = 10,
    dimensions = {
        width = 0.8,
        height = 0.8,
        x = 0.5,
        y = 0.5,
    },
})

M.setup = function()
    vim.api.nvim_create_user_command("OpenNNN", function()
        nnn:open()
    end, {})

    vim.api.nvim_create_user_command("CloseNNN", function()
        nnn:close()
    end, {})

    vim.api.nvim_create_user_command("ExitNNN", function()
        nnn:exit()
    end, {})
end

return M

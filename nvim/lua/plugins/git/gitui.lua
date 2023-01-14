local M = {}

local fterm = require("FTerm")

local gitui = fterm:new({
    ft = "GitUI",
    cmd = "gitui",
    border = "rounded",
    blend = 10,
    dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
    },
})

M.setup = function()
    vim.api.nvim_create_user_command("OpenGitUI", function()
        gitui:open()
    end, {})
    vim.api.nvim_create_user_command("CloseGitUI", function()
        gitui:close()
    end, {})
    vim.api.nvim_create_user_command("ExitGitUI", function()
        gitui:exit()
    end, {})
end

return M

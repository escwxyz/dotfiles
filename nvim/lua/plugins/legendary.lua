-- Search keymaps and cmds
-- ~~~~~~~~~~~~~~~~~~~~~~~
-- https://github.com/mrjones2014/legendary.nvim#installation

local M = {}

M.setup = function()
    require("legendary").setup({
        select_prompt = "Command Palette",
        which_key = {
            auto_register = true,
        },
    })
end

return M

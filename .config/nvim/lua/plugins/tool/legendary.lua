--- Search keymaps and cmds
--- ~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/mrjones2014/legendary.nvim#installation

local M = {}

M.setup = function()
    require("legendary").setup({
        which_key = {
            auto_register = true, -- TODO still not working
        },
    })
end

return M

local M = {}

M.setup = function()
    require("mini.animate").setup({
        cursor = {
            enable = true,
            path = require("mini.animate").gen_path.walls(),
        },
        scroll = {
            enable = true,
        },
    })
end

return M

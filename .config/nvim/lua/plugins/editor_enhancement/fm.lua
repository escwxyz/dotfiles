local M = {}

M.setup = function()
    require("fm-nvim").setup({
        ui = {
            default = "float",
            float = {
                border = "rounded",
                blend = 10,
            }
        }
    })
end

return M

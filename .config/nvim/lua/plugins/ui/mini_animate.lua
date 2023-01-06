local M = {}

M.setup = function()
    require("mini.animate").setup({
        cursor = {
            enabled = true,
        },
        scroll = {
            enabled = true,
        },
        resize = {
            enabled = false,
        }
    })
end

return M

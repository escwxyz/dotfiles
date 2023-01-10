-- Windows Size Adjustment
--  ~~~~~~~~~~~~~~~~~~~~~
--  https://github.com/anuvyklack/windows.nvim/blob/main/doc/windows.txt

local M = {}

M.setup = function()
    require("windows").setup({
        autowidth = {
            enable = true,
            winwidth = 5,
            filetype = {
                help = 2,
            },
        },

        ignore = {
            buftype = { "quickfix" },
            filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }, -- TODO
        },

        animation = {
            enable = true,
            duration = 200,
            fps = 60,
            easing = "in_out_sine",
        },
    })
end

return M

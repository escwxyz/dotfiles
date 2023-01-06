local M = {}

M.setup = function()
    require("nvim-navic").setup({ icons = require("configs.icons").navic_icons,
        highlight = false,
        separator = " > ",
        depth_limit = 5,
        depth_limit_indicator = "..",
        safe_output = true, })
end

return M

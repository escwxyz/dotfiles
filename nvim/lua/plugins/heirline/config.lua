local M = {}

M.setup = function()
    require("heirline").setup({
        -- statusline = require("plugins.heirline.components.statusline"),
        winbar = require("plugins.heirline.components.winbar"),
        -- tabline = require("plugins.heirline.components.tabline"),
        tabline = require("plugins.heirline.components.statusline"),
    })
end

return M

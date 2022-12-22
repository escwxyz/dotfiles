--- Showing diagnostics etc.
--- ~~~~~~~~~~~~~~~~~~~~~~~~
--- See https://github.com/folke/trouble.nvim

local M = {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup()
    end
}

return M

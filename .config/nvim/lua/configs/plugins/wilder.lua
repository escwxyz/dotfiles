--- CMD Autocomplete
--- ~~~~~~~~~~~~~~~~
--- See https://github.com/gelguy/wilder.nvim
-- TODO not working

local M = {
    "gelguy/wilder.nvim",
    config = function()
        require("wilder").setup({ modes = { ':', '/', '?' } })
    end
}


return M

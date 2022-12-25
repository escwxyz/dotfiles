--- Navigation inside buffer / window
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/ggandor/leap.nvim#getting-started

local M = {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    event = "BufReadPre",
    config = function()
        require("leap").add_default_mappings()
        -- TODO
    end
}

return M

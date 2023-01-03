--- Navigation inside buffer / window
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/ggandor/leap.nvim/blob/main/doc/leap.txt

return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    event = "VeryLazy",
    config = function()
        local leap = require("leap")

        leap.opts.case_sensetive = true

        leap.add_default_mappings({ true }) -- NOTE overwrite other conflicting keymaps
    end,
}

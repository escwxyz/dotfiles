--- Comment Plugin
--- ~~~~~~~~~~~~~~
--- https://github.com/numToStr/Comment.nvim

local M = {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
        require("comment").setup({
            toggler = {
                line = "gcc", -- (un)comment current line of code
                block = "gbb", -- (un)comment the block code of current line
            },
            mappings = {
                basic = true,
                extra = false,
            }
        })
    end
}


return M

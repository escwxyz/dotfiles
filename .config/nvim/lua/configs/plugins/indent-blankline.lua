--- 用于显示缩进回车等
--- ~~~~~~~~~~~~~~~
--- https://github.com/lukas-reineke/indent-blankline.nvim

--- TODO 增加一个开关，用于开启网格等
--- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt


return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
        require("indent_blankline").setup {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
        }
    end
}

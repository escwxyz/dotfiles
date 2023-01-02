--- 用于显示缩进回车等
--- ~~~~~~~~~~~~~~~
--- https://github.com/lukas-reineke/indent-blankline.nvim

--- TODO 增加一个开关，用于开启网格等
--- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt


vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]


return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
        require("indent_blankline").setup {
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,

        }
    end
}

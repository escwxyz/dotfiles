--- Code Outline
--- ~~~~~~~~~~~~
--- https://github.com/stevearc/aerial.nvim#options

-- TODO

return {
    "stevearc/aerial.nvim",
    event = "BufReadPre",
    config = function()
        require("aerial").setup()
    end
}

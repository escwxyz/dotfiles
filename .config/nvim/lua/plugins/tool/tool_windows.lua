--- Window Management (windows & winshift & smart-splits)
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/sindrets/winshift.nvim
--- https://github.com/anuvyklack/windows.nvim
--- https://github.com/mrjones2014/smart-splits.nvim
-- TODO remove default keymaps

return {
    "anuvyklack/windows.nvim",
    dependencies = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim",
        "sindrets/winshift.nvim",
        "mrjones2014/smart-splits.nvim",
    },
    keys = {
        "<leader>w"
    },
    config = function()
        require("windows").setup({
            ignore = {
                buftype = { "quickfix" },
                filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }, -- TODO
            },
            animation = {
                enable = true,
                duration = 300,
                fps = 60,
                easing = "in_out_sine",
            },
        })
        require("winshift").setup({
            keymaps = {
                disable_defaults = true,
            },
        })
        require("smart-splits").setup({
            ignored_filetypes = {
                "nofile",
                "quickfix",
                "prompt",
            },
            -- ignored_buftypes = { 'NvimTree' }
        })
    end,
}

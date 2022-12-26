return {
    "epwalsh/obsidian.nvim",
    ft = "markdown", -- as temperary way, should be lazy loaded when open files from obsidian directory
    config = function()
        require("obsidian").setup({
            dir = "~/Documents/Obsidian",
            completion = {
                nvim_cmp = true,
            }
        })
    end
}

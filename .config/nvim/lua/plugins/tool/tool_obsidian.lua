return {
    "epwalsh/obsidian.nvim",
    config = function()
        require("obsidian").setup({
            dir = "~/Documents/Obsidian",
            completion = {
                nvim_cmp = true,
            },
        })
    end,
}

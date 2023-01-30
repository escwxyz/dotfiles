return {
    "echasnovski/mini.animate",
    enabled = not vim.g.neovide,
    event = "CursorMoved",
    config = function()
        require("mini.animate").setup({
            cursor = {
                enable = true,
                path = require("mini.animate").gen_path.walls(),
            },
            scroll = {
                enable = true,
            },
        })
    end,
}

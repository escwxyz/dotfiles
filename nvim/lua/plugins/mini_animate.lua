return {
    "echasnovski/mini.animate",
    enabled = true,
    event = "VeryLazy",
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
    end
}

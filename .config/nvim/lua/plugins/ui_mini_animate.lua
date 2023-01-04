return {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    config = function()
        require("mini.animate").setup({
            cursor = {
                enabled = true,
            },
            scroll = {
                enabled = true,
            },
            resize = {
                enabled = false,
            }
        })
    end
}

return {
    "rcarriga/nvim-notify",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("notify").setup({
            background_colour = "Normal",
            fps = 30,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = "",
            },
            level = 2,
            minimum_width = 50,
            render = "default",
            stages = "fade_in_slide_out",
            timeout = 2000,
            top_down = true,
        })
        vim.notify = require("notify")
    end,
}

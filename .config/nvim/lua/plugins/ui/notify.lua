local M = {}

M.setup = function()
    local notify = require("notify")
    notify.setup({
        background_colour = "Normal",
        fps = 30,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true
    })

    vim.notify = notify
end

return M

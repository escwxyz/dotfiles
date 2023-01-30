local Lazy = {
    condition = require("lazy.status").has_updates,
    update = { "User", pattern = "LazyUpdate" },
    provider = function()
        return require("lazy.status").updates()
    end,
    hl = {
        fg = require("heirline.utils").get_highlight("String").fg,
        bg = require("heirline.utils").get_highlight("StatusLine").bg,
    },
}

return Lazy

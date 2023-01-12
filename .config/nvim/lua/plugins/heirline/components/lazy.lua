local Lazy = {
    condition = require("lazy.status").has_updates,
    update = { "User", pattern = "LazyUpdate" },
    provider = function()
        return require("lazy.status").updates()
    end,
    hl = { fg = "text_highlight", bg = "background" },
}

return Lazy

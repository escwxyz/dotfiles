local Navic = {
    condition = require("nvim-navic").is_available,
    provider = function()
        return require("nvim-navic").get_location({ highlight = true })
    end,

    update = "CursorMoved",
}

return Navic

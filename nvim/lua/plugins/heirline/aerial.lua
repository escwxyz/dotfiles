-- TODO ref https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua

local utils = require("heirline.utils")

local format = function(symbols)
    local parts = {}
    local depth = #symbols

    if depth > 0 then
        symbols = { unpack(symbols, 1, depth) }
    else
        symbols = { unpack(symbols, #symbols + 1 + depth) }
    end

    for _, symbol in ipairs(symbols) do
        local name = symbol.name
        local icon = symbol.icon

        table.insert(parts, string.format("%s %s", icon, name))
    end

    return parts --table.concat(parts, with separtors)
end

local Aerial = {
    init = function(self)
        local symbols = require("aerial").get_location(true)
        self.symbols = symbols
        print(vim.inspect(symbols))
    end,
    provider = function(self) end,
    update = "CursorMoved",
}

return Aerial

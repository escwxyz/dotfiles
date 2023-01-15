-- TODO it's freezed

local Hydra = {
    init = function(self)
        self.hint = require("hydra.statusline").get_hint()
        self.name = require("hydra.statusline").get_name()
    end,

    provider = function(self)
        return self.name .. ": " .. tostring(vim.inspect(self.hint))
    end,
}

return Hydra

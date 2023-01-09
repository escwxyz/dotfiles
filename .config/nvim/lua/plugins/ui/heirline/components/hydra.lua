local Hydra = {
    init = function(self)
        self.is_active = require("hydra.statusline").is_active()
        self.hydra_name = self.is_active and require("hydra.statusline").get_name() or nil
        self.hint = self.is_active and require("hydra.statusline").get_hint() or nil
    end,

    provider = function(self)
        return self.is_active and self.hydra_name .. ": " .. tostring(vim.inspect(self.hint))
    end,

    cond = function(self)
        return self.is_active
    end,
}

return Hydra

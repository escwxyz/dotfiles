local utils = require("heirline.utils")

local Tabpage = {
    provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
    end,
    hl = function(self)
        if not self.is_active then
            return { fg = "tabline_fg", bg = "background" }
        else
            return { fg = "tabline_sl_fg", bg = "background" }
        end
    end,
}

local TabPages = utils.make_tablist(Tabpage)

local TabList = {
    condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
    end,
    { provider = "%=" },

    {
        provider = "",
        hl = { fg = "background", bg = "tabline_bg" },
    },
    TabPages,
    {
        provider = "",
        hl = { fg = "background", bg = "tabline_bg" },
    },
}

return TabList

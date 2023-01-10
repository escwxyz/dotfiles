local utils = require("heirline.utils")

local Tabpage = {
    provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
    end,
    hl = function(self)
        if not self.is_active then
            return "TabLine"
        else
            return "TabLineSel"
        end
    end,
}

local TabPages = utils.surround({ "", "" }, nil, { utils.make_tablist(Tabpage) })

local TabList = {
    condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
    end,
    TabPages,
}

return TabList

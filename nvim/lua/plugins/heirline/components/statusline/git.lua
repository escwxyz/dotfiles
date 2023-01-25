local conditions = require("heirline.conditions")

local utils = require("heirline.utils")

local GitStatus = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict -- TODO this var is from gitsigns, it's local to buffer, when open a floating pop, it's gone
        self.has_changes = self.status_dict ~= nil and self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
    end,

    hl = utils.get_highlight("Constant"),

    {
        provider = function(self)
            return "  " .. self.status_dict.head
        end,
        hl = { bold = true },
    },

    {
        condition = function(self)
            return self.has_changes
        end,
        provider = " ",
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = utils.get_highlight("DiffAdd").fg },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (" ~" .. count)
        end,
        hl = { fg = utils.get_highlight("DiffChange").fg },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (" -" .. count)
        end,
        hl = { fg = utils.get_highlight("DiffDelete").fg },
    },

    {
        condition = function(self)
            return self.has_changes
        end,
        provider = " ",
    },
    {
        provider = "",
        hl = { fg = utils.get_highlight("Constant").bg },
    },
}

return GitStatus

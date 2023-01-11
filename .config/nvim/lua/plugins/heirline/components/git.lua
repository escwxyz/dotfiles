-- TODO git component disappear when there is popup

local conditions = require("heirline.conditions")

local GitStatus = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict -- TODO this var is from gitsigns, it's local to buffer, when open a floating pop, it's gone
        self.has_changes = self.status_dict ~= nil and self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
    end,

    hl = { fg = "foreground", bg = "background_nc" },

    { -- git branch name
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
        hl = { fg = "git_add_fg" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (" ~" .. count)
        end,
        hl = { fg = "git_change_fg" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (" -" .. count)
        end,
        hl = { fg = "git_delete_fg" },
    },

    {
        condition = function(self)
            return self.has_changes
        end,
        provider = " ",
    },
    {
        provider = "",
        hl = { fg = "background_nc", bg = "background" },
    },
}

return GitStatus

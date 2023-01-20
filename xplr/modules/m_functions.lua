local M = {}
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local builtin = xplr.fn.builtin

M.setup = function()
    builtin.fmt_general_table_row_cols_4 = function(m)
        return tostring(os.date("%H:%M %x", m.last_modified / 1000000000))
    end
end

return M

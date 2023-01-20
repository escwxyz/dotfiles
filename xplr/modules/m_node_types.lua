local M = {}
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local nt = xplr.config.node_types

M.setup = function()
    nt.directory = {
        style = {
            fg = "LightBlue",
        },
    }
end

return M

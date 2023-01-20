local M = {}
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local table = xplr.config.general.table

M.setup = function()
    table.header.height = 2
end

return M

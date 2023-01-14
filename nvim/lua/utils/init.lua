local M = {}

--- Get the index for a value in table
---@param array table
---@param value string | number
---@return number | nil
M.indexOf = function(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

--- Change file based on line number
---@param line_nr string
---@param from string | number
---@param to string | number
---@param fname string
M.sad = function(line_nr, from, to, fname)
    local cmd = string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)
    vim.cmd(cmd)
end

M.is_floating_win = function(winid)
    return vim.api.nvim_win_get_config(winid).relative ~= ""
end

return M

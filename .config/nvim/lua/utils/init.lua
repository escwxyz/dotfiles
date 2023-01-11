local M = {}

M.indexOf = function(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

M.sad = function(line_nr, from, to, fname)
    local cmd = string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)
    vim.cmd(cmd)
end

return M

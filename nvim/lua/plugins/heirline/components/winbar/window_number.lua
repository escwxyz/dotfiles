local is_floating_win = require("utils").is_floating_win

local WindowNumber = {
    provider = function()
        return "#" .. vim.api.nvim_win_get_number(0) .. " "
    end,
    hl = { italic = true },
    condition = function()
        local winid = vim.api.nvim_tabpage_get_win(0)
        return not is_floating_win(winid)
    end,
    update = "WinNew",
}

return WindowNumber

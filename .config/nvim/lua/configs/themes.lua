local M = {}

local sqlite = require("plugins.sqlite").db

local theme_list = {
    "cupcake",
    "catppuccin",
    "everforest",
    "material",
    "ocean",
    "oceanicnext",
    "rose-pine",
    "rose-pine-dawn",
    "tokyo-city-dark",
}

M.theme_list = theme_list
-- TODO need to improve the code
M.save_theme = function(theme)
    sqlite:with_open(function()
        sqlite:delete("theme", { where = { id = 1 } })
        sqlite:insert("theme", { id = 1, name = theme })
    end)
end

M.get_theme = function()
    return sqlite:with_open(function()
        return sqlite:select("theme", { where = { id = 1 } })
    end)
end

M.init_theme = function()
    local t = M.get_theme()
    vim.g.Theme = #t > 0 and t[1]["name"] or "base16-catppuccin"
    vim.cmd("colorscheme " .. vim.g.Theme)
end

return M

local M = { db = nil }

local theme_path = vim.fn.stdpath("data") .. "/databases/theme.db"
-- this should be lazy loaded

M.setup_theme_table = function()
    local ok, connection = pcall(require, "sqlite")
    if not ok then
        vim.notify("SQLite failed to start", vim.log.levels.ERROR)
        return
    end

    vim.fn.mkdir(string.match(theme_path, "(.*[/\\])"), "p")

    M.db = connection:open(theme_path)

    if not M.db then
        vim.notify("Error opening SQLite database", vim.log.levels.ERROR)
        return
    end

    if not M.db:exists({ "theme" }) then
        M.db:create("theme", { id = { "int", "primary", "key" }, name = "text" })
    end

    M.db:close()
end

M.save_theme = function() end

return M

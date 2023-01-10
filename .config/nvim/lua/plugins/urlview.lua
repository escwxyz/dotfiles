local M = {}

M.setup = function()
    require("urlview").setup({
        default_title = "Links:",
        -- Default picker to display links with
        -- Options: "native" (vim.ui.select) or "telescope"
        default_picker = "native",
        -- Set the default protocol for us to prefix URLs with if they don't start with http/https
        default_prefix = "https://",
        -- Command or method to open links with
        -- Options: "netrw", "system" (default OS browser), "clipboard"; or "firefox", "chromium" etc.
        -- By default, this is "netrw", or "system" if netrw is disabled
        default_action = "firefox",
        log_level_min = vim.log.levels.WARN,
        -- Keymaps for jumping to previous / next URL in buffer
        -- jump = {
        --     prev = "[u",
        --     next = "]u",
        -- },
    })
end

return M

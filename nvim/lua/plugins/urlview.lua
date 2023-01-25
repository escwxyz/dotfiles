local opts = {
    default_title = "Links:",
    default_picker = "native",
    default_prefix = "https://",
    default_action = "system",
    log_level_min = vim.log.levels.WARN,
    -- Keymaps for jumping to previous / next URL in buffer
    -- jump = {
    --     prev = "[u",
    --     next = "]u",
    -- },
}

return {
    "axieax/urlview.nvim",
    enabled = true,
    cmd = "UrlView",
    config = function()
        require("urlview").setup(opts)
    end
}

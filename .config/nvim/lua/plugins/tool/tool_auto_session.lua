return {
    "rmagatti/auto-session",
    enabled = false,
    config = function()
        require("auto-session").setup({
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
            auto_session_enabled = true,
        })
    end
}

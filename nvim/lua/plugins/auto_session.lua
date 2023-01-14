local M = {}

M.setup = function()
    require("auto-session").setup({
        log_level = "error",
        auto_session_enable_last_session = true,
        auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
        auto_session_enabled = true,
    })
end

return M

local M = {}

M.setup = function()
    require("neoclip").setup({
        history = 1000,
        enable_persistent_history = true,
        length_limit = 1048576,
        continuous_sync = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.db",
        filter = nil,
        preview = true,
        prompt = nil,
        default_register = '"',
        default_register_macros = "q",
        enable_macro_history = false,
        content_spec_column = false,
        on_paste = {
            set_reg = false,
        },
        on_replay = {
            set_reg = false,
        },
        keys = {
            fzf = {
                select = "default",
                paste = "ctrl-p",
                paste_behind = "ctrl-k",
                custom = {},
            },
        },
    })
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("Neoclip", function()
        require("neoclip.fzf")()
    end, {})
end

return M

local M = {}

M.setup = function()
    require("neogen").setup({
        enabled = true,
        input_after_comment = true,
        -- snippet_engine = "luasnip",
    })
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("NeogenNext", require("neogen").jump_next, {})
    vim.api.nvim_create_user_command("NeogenPrev", require("neogen").jump_prev, {})
end

return M

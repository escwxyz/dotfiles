local M = {}

M.setup = function()
    require("mini.bufremove").setup()
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("BufferRemove", "lua MiniBufremove.delete()", {})
end

return M

return {
    "echasnovski/mini.bufremove",
    enabled = true,
    cmd = { "BufferRemove" },
    config = function()
        require("mini.bufremove").setup()
        vim.api.nvim_create_user_command("BufferRemove", "lua MiniBufremove.delete()", {})
    end
}

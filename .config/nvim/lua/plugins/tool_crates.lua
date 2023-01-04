return {
    "saecki/crates.nvim",
    lazy = false,
    cond = function()
        local buf = vim.api.nvim_buf_get_name(0)
        if string.sub(buf, -10) == "Cargo.toml" then
            return true
        end
        return false
    end,
    config = function()
        require("crates").setup()
    end,
}

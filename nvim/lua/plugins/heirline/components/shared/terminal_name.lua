return {
    provider = function(_)
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname:match("%w+") -- returns the string before the first space
    end,
    hl = { bold = true },
}

local M = {}

M.setup = function()
    require("better_escape").setup({
        mapping = { "jk", "jj" },
        keys = function()
            return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        end,
    })
end

return M

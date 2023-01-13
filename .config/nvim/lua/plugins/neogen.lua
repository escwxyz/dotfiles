local M = {}

M.setup = function()
    require("neogen").setup({
        enabled = true,
        input_after_comment = true,
        snippet_engine = "luasnip",
    })
end

return M

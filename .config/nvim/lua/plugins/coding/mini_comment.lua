local M = {}
-- NOTE not support blockwise comment
M.setup = function()
    require("mini.comment").setup({ -- Module mappings. Use `''` (empty string) to disable one.
        -- NOTE disable all default keymaps
        mappings = {
            -- Toggle comment (like `gcip` - comment inner paragraph) for both
            -- Normal and Visual modes
            comment = "",

            -- Toggle comment on current line
            comment_line = "",

            -- Define 'comment' textobject (like `dgc` - delete whole comment block)
            textobject = "",
        },
        hooks = {
            pre = function()
                require("ts_context_commentstring.internal").update_commentstring()
            end,

            post = function() end,
        },
    })
end

return M

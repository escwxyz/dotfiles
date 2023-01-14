-- For select according to treesitter text object

local M = {}

M.setup = function()
    local ai = require("mini.ai")
    ai.setup({
        -- Table with textobject id as fields, textobject specification as values.
        -- Also use this to disable builtin textobjects. See |MiniAi.config|.
        custom_textobjects = {
            o = ai.gen_spec.treesitter({
                a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Main textobject prefixes
            around = "a",
            inside = "i",

            -- Next/last variants
            around_next = "an",
            inside_next = "in",
            around_last = "al",
            inside_last = "il",

            -- Move cursor to corresponding edge of `a` textobject
            goto_left = "g[",
            goto_right = "g]",
        },

        -- Number of lines within which textobject is searched
        n_lines = 100,

        -- How to search for object (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
        search_method = "cover_or_next",
    })
end

return M

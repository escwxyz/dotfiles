return {
    "echasnovski/mini.ai",
    enabled = true,
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function()
                require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
            end,
        },
    },
    keys = { { "a", mode = { "x", "o" } }, { "i", mode = { "x", "o" } } },
    config = function()
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
                around = "a",
                inside = "i",

                around_next = "an",
                inside_next = "in",
                around_last = "al",
                inside_last = "il",

                goto_left = "g[",
                goto_right = "g]",
            },

            n_lines = 100,

            -- How to search for object (first inside current line, then inside
            -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
            search_method = "cover_or_next",
        })
    end
}

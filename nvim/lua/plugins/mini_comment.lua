local opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "gc",

        -- Toggle comment on current line
        comment_line = "gcc",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "gc",
    },
    hooks = {
        pre = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end,

        post = function() end,
    },
}

return {
    "echasnovski/mini.comment",
    enabled = true,
    keys = { { "gc", mode = { "n", "x" } }, { "gcc" } },
    dependencies = {
        { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    config = function()
        require("mini.comment").setup(opts)
    end
}

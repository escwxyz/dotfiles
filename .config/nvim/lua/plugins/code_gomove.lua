--- Move & Duplicate Codes
--- ~~~~~~~~~~~~~~~~~~~~~~

return {
    "booperlv/nvim-gomove",
    event = "VeryLazy",
    config = function()
        require("gomove").setup({
            map_defaults = false, -- for better which-key description
            reindent = true,
            -- whether or not to undojoin same direction moves (true/false)
            undojoin = true,
            -- whether to not to move past end column when moving blocks horizontally, (true/false)
            move_past_end_col = false,
        })
    end
}

local M = {}

M.setup = function()
    require("dressing").setup({
        input = {
            enabled = true,
            prompt_align = "center",
            start_in_insert = true,
            mappings = {
                n = {
                    ["<Esc>"] = "Close",
                    ["<CR>"] = "Confirm",
                },
                i = {
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                },
            },
        },
        select = {
            enabled = true,
            backend = {
                "fzf_lua", "fzf", "builtin",
            },
            fzf_lua = {
                winopts = {
                    width = 0.5,
                    height = 0.4,
                },
            },
            builtin = {
                anchor = "NW",
                border = "rounded",
                relative = "editor",

                buf_options = {},
                win_options = {
                    winblend = 10,
                },

                -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- the min_ and max_ options can be a list of mixed types.
                -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
                width = nil,
                max_width = { 140, 0.8 },
                min_width = { 40, 0.2 },
                height = nil,
                max_height = 0.9,
                min_height = { 10, 0.2 },
                mappings = {
                    ["<Esc>"] = "Close",
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                },
            },
        }
    })
end

return M

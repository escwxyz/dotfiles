return {
    "nvim-lua/plenary.nvim",
    "folke/neodev.nvim",
    "nvim-tree/nvim-web-devicons",
    { "anuvyklack/hydra.nvim", event = "VeryLazy" },
    {
        "stevearc/dressing.nvim",
        event = "BufReadPre",
        config = function()
            require("dressing").setup({
                input = {
                    mappings = false,
                }
            })
        end
    },
    {
        "xiyaowong/nvim-transparent",
        event = "VeryLazy",
        config = function()
            require("transparent").setup({
                enabled = false, -- TODOs
                -- extra_groups = "all"
            })
        end
    },
    {
        "max397574/better-escape.nvim",
        event = "BufWinEnter",
        config = function()
            require("better_escape").setup({
                mapping = { "jk", "jj" },
                keys = function()
                    return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
                end,
            })
        end
    },
    {
        "luukvbaal/stabilize.nvim",
        init = function() require("stabilize").setup() end
    },
    --- TODO multi theming match awesome wm
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = vim.g.transparent_enabled,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    notify = false,
                    mini = false,
                    dap = {
                        enabled = true,
                        enable_ui = true, -- enable nvim-dap-ui
                    }
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })
            -- setup must be called before loading
            vim.cmd.colorscheme "catppuccin"
        end
    },
}

return {
    "nvim-lua/plenary.nvim",
    "folke/neodev.nvim",
    "nvim-tree/nvim-web-devicons",
    "anuvyklack/hydra.nvim",
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
    },
    {
        "luukvbaal/stabilize.nvim",
        init = function() require("stabilize").setup() end
    },
    {
        "folke/twilight.nvim",
        event = "BufReadPre",
        config = function()
            require("twilight").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    --- TODO multi theming match awesome wm
    {
        "catppuccin/nvim",
        init = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
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
                    gitsigns = false,
                    telescope = true,
                    notify = false,
                    mini = false,
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })
            -- setup must be called before loading
            vim.cmd.colorscheme "catppuccin"
        end
    },

    {
        "simrat39/rust-tools.nvim",
        ft = "rs"
    },
    {
        "jose-elias-alvarez/typescript.nvim",
        ft = { "ts", "tsx", "js", "jsx" }
    },
    {
        "b0o/SchemaStore.nvim",
        ft = { "json" }
    },
    {
        "akinsho/flutter-tools.nvim",
        ft = { "dart" }
    }
}

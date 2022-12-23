--- `init`: function is always executed during startup
--- `config`: function is executed when the plugin loads
--- `build`: function is executed when a plugin is installed or updated
--- Event Name:
--- --- "BufReadPre": when open file directly inside terminal `nvim filename`, earliest
--- --- "BufRead": when open a buffer?
--- --- "BufReadPost": after open a buffer?
--- --- "VeryLazy": when not urgent for the inital ui

return {
    -- Common functions for different plugins
    "nvim-lua/plenary.nvim",
    -- This is for lua https://github.com/folke/neodev.nvim
    "folke/neodev.nvim",
    -- Icons for multiple plugins
    "nvim-tree/nvim-web-devicons",
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
                    cmp = false,
                    gitsigns = false,
                    nvimtree = true,
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
    ---
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end
    },
    --- TypeScript LSP
    "jose-elias-alvarez/typescript.nvim",
    --- Rust LSP
    "simrat39/rust-tools.nvim",
    --- Support Hot Reload for flutter project
    -- TODO 'akinsho/flutter-tools.nvim'
}

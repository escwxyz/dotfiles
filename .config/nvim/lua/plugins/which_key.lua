local M = {}

M.setup = function()
    require("which-key").setup({
        plugins = {
            marks = false, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        -- change display
        key_labels = {
            ["<CR>"] = "Return",
            ["<Tab>"] = "Tab",
            ["<S-Tab>"] = "Tab + Shift",
            ["<M-h>"] = "Alt + h",
            ["<M-j>"] = "Alt + j",
            ["<M-k>"] = "Alt + k",
            ["<M-l>"] = "Alt + l",
            ["<M-H>"] = "Alt + H",
            ["<M-J>"] = "Alt + J",
            ["<M-K>"] = "Alt + K",
            ["<M-L>"] = "Alt + L",
        },
        -- TODO
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
            scroll_down = "<A-d>", -- binding to scroll down inside the popup
            scroll_up = "<A-u>", -- binding to scroll up inside the popup
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 2, 2, 2, 2 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 40 }, -- min and max width of the columns
            spacing = 6, -- spacing between columns
            align = "center", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        triggers = "auto", -- automatically setup triggers
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
    })
end

return M

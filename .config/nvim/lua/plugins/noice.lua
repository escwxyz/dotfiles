local M = {}

M.setup = function()
    require("noice").setup({
        cmdline = {
            enabled = true, -- enables the Noice cmdline UI
        },
        messages = {
            -- NOTE: If you enable messages, then the cmdline is enabled automatically.
            -- This is a current Neovim limitation.
            enabled = false, -- enables the Noice messages UI
        },
        popupmenu = {
            enabled = false, -- enables the Noice popupmenu UI
            backend = "nui", -- backend to use to show regular cmdline completions
            -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
            kind_icons = {}, -- set to `false` to disable icons
        },
        -- default options for require('noice').redirect
        -- see the section on Command Redirection
        redirect = {
            view = "popup",
            filter = { event = "msg_show" },
        },
        notify = {
            enabled = true,
            view = "notify",
        },
        lsp = {
            progress = {
                enabled = false,
                -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                -- See the section on formatting for more details on how to customize.
                format = "lsp_progress",
                format_done = "lsp_progress_done",
                throttle = 1000 / 30,
                view = "mini",
            },
            override = {
                -- override the default lsp markdown formatter with Noice
                ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                -- override the lsp markdown formatter with Noice
                ["vim.lsp.util.stylize_markdown"] = false,
                -- override cmp documentation with Noice (needs the other options to work)
                ["cmp.entry.get_documentation"] = false,
            },
            hover = {
                enabled = false,
                view = nil, -- when nil, use defaults from documentation
                opts = {}, -- merged with defaults from documentation
            },
            signature = {
                enabled = false,
                auto_open = {
                    enabled = true,
                    trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                    luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                    throttle = 50, -- Debounce lsp signature help request by 50ms
                },
                view = nil, -- when nil, use defaults from documentation
                opts = {}, -- merged with defaults from documentation
            },
            message = {
                -- Messages shown by lsp servers
                enabled = true,
                view = "notify",
                opts = {},
            },
            -- defaults for hover and signature help
            documentation = {
                view = "hover",
                opts = {
                    lang = "markdown",
                    replace = true,
                    render = "plain",
                    format = { "{message}" },
                    win_options = { concealcursor = "n", conceallevel = 3 },
                },
            },
        },
        markdown = {
            hover = {
                ["|(%S-)|"] = vim.cmd.help, -- vim help links
                ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
            },
            highlights = {
                ["|%S-|"] = "@text.reference",
                ["@%S+"] = "@parameter",
                ["^%s*(Parameters:)"] = "@text.title",
                ["^%s*(Return:)"] = "@text.title",
                ["^%s*(See also:)"] = "@text.title",
                ["{%S-}"] = "@parameter",
            },
        },
        health = {
            checker = true, -- Disable if you don't want health checks to run
        },
        smart_move = {
            -- noice tries to move out of the way of existing floating windows.
            enabled = false, -- you can disable this behaviour here
            -- add any filetypes here, that shouldn't trigger smart move.
            excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
        },
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = false, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        views = {},
        routes = {}, --- @see section on routes
        status = {}, --- @see section on statusline components
        format = {}, --- @see section on formatting
    })
end

return M

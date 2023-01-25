local M = {}

M.setup = function()
    local rt = require("rust-tools")
    rt.setup({
        server = {
            standalone = false,
            capabilities = require("plugins.lsp.capabilities"),
            on_attach = function(_, bufnr)
                require("plugins.lsp.on_attach")(_, bufnr)
                -- TODO add more rust specific keymaps
                -- Hover actions
                vim.keymap.set("n", "<leader>ch", rt.hover_actions.hover_actions, { desc = "[RS] Hover", buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<leader>cr", rt.code_action_group.code_action_group,
                    { desc = "[RS] Actions", buffer = bufnr })
            end,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        },
        dap = {
            -- adapters = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path), -- todo may use adapter from mason
        },
        tools = {
            -- how to execute terminal commands
            -- options right now: termopen / quickfix
            -- executor = require("rust-tools.executors").termopen,

            -- callback to execute once rust-analyzer is done initializing the workspace
            -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
            on_initialized = nil,

            -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
            reload_workspace_from_cargo_toml = true,

            -- These apply to the default RustSetInlayHints command
            inlay_hints = {
                -- automatically set inlay hints (type hints)
                -- default: true
                auto = true,

                -- Only show inlay hints for the current line
                only_current_line = false,

                -- whether to show parameter hints with the inlay hints or not
                -- default: true
                show_parameter_hints = true,

                -- prefix for parameter hints
                -- default: "<-"
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                -- default: "=>"
                other_hints_prefix = "=> ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
            },
            -- options same as lsp hover / vim.lsp.util.open_floating_preview()
            hover_actions = {
                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },

                -- Maximal width of the hover window. Nil means no max.
                max_width = nil,

                -- Maximal height of the hover window. Nil means no max.
                max_height = nil,

                -- whether the hover action window gets automatically focused
                -- default: false
                auto_focus = false,
            },

            -- settings for showing the crate graph based on graphviz and the dot
            -- command
            crate_graph = {
                -- Backend used for displaying the graph
                -- see: https://graphviz.org/docs/outputs/
                -- default: x11
                backend = "x11",
                -- where to store the output, nil for no output stored (relative
                -- path from pwd)
                -- default: nil
                output = nil,
                -- true for all crates.io and external crates, false only the local
                -- crates
                -- default: true
                full = true,
            },
        },
    })

end

return M

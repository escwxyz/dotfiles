local M = {}

M.setup = function()
    require("nvim-treesitter.configs").setup({
        -- NOTE this has huge effect on startup time
        ensure_installed = {
            "bash",
            "dart",
            "help",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "rust",
            "solidity",
            "toml",
            "tsx",
            "typescript",
            "yaml",
        },
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = "<S-CR>",
                node_decremental = "<S-BS>",
            },
        },
        indent = {
            enable = false,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = true, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
            },
        },
    })
end

return M

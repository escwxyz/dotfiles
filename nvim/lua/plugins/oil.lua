local M = {}

M.setup = function()
    require("oil").setup({
        -- See :help oil-columns
        columns = {
            "icon",
        },
        buf_options = {},
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "n",
        },
        restore_win_options = true,
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = false,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
        -- Additionally, if it is a string that matches "action.<name>",
        -- it will use the mapping at require("oil.action").<name>
        -- Set to `false` to remove a keymap
        -- TODO
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["g."] = "actions.toggle_hidden",
        },
        use_default_keymaps = true,
        view_options = {
            show_hidden = false,
        },
        -- Configuration for the floating window in oil.open_float
        float = {
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
                winblend = 10,
            },
        },
    })
end

return M

local M = {}

M.setup = function()
    require("oil").setup({
        -- TODO adjust filename's order??
        columns = {
            "icon",
            { "mtime", highlight = "Comment", format = "%T %y-%m-%d" },
        },
        buf_options = {
            buflisted = false,
        },
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
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-v>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-s>"] = "actions.save",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["<BS>"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["g."] = "actions.toggle_hidden",
        },
        use_default_keymaps = true,
    })
end

return M

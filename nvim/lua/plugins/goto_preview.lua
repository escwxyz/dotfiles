local opts = {
    width = 120,
    height = 15,
    border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, --TODO rounded border
    default_mappings = false,
    debug = false,
    opacity = 10,
    resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
    post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
    references = {
        telescope = nil,
    },
    -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
    focus_on_open = true, -- Focus the floating window when opening it.
    dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
    force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
    bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
}

local M = {
    "rmagatti/goto-preview",
    enabled = true,
    cmd = {
        "GotoPreviewDefinition",
        "GotoPreviewTypeDefinition",
        "GotoPreviewImplementation",
        "GotoPreviewReference",
    },
    config = function()
        require("goto-preview").setup(opts)
        vim.api.nvim_create_user_command("GotoPreviewDefinition", function()
            require("goto-preview").goto_preview_definition()
        end, {})
        vim.api.nvim_create_user_command("GotoPreviewTypeDefinition", function()
            require("goto-preview").goto_preview_type_definition()
        end, {})
        vim.api.nvim_create_user_command("GotoPreviewImplementation", function()
            require("goto-preview").goto_preview_implemention()
        end, {})
        vim.api.nvim_create_user_command("GotoPreviewReference", function()
            require("goto-preview").goto_preview_reference()
        end, {})
        vim.api.nvim_create_user_command("GotoPreviewCloseWin", function()
            require("goto-preview").close_all_win()
        end, {})
    end,
}

return M

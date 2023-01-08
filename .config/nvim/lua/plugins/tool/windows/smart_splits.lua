-- Window Split & Resize
-- ~~~~~~~~~~~~~~~~~~~~~
-- https://github.com/mrjones2014/smart-splits.nvim

local M = {}

M.setup = function()
    require("smart-splits").setup({
        -- Ignored filetypes (only while resizing)
        ignored_filetypes = {
            "nofile",
            "quickfix",
            "prompt",
        },
        -- Ignored buffer types (only while resizing)
        ignored_buftypes = { "NvimTree" },
        -- the default number of lines/columns to resize by at a time
        default_amount = 3,
        -- whether to wrap to opposite side when cursor is at an edge
        -- e.g. by default, moving left at the left edge will jump
        -- to the rightmost window, and vice versa, same for up/down.
        wrap_at_edge = true,
        -- when moving cursor between splits left or right,
        -- place the cursor on the same row of the *screen*
        -- regardless of line numbers. False by default.
        -- Can be overridden via function parameter, see Usage.
        move_cursor_same_row = false,
        resize_mode = {
            quit_key = "<ESC>",
            resize_keys = { "h", "j", "k", "l" },
            silent = false,
            hooks = {
                on_enter = function() end,
                on_leave = function() end,
            },
        },
        -- ignore these autocmd events (via :h eventignore) while processing
        -- smart-splits.nvim computations, which involve visiting different
        -- buffers and windows. These events will be ignored during processing,
        -- and un-ignored on completed. This only applies to resize events,
        -- not cursor movement events.
        ignored_events = {
            "BufEnter",
            "WinEnter",
        },
        -- enable or disable the tmux integration
        tmux_integration = false, -- TODO
        -- disable tmux navigation if current tmux pane is zoomed
        disable_tmux_nav_when_zoomed = true,
    })
end

M.setup_cmd = function()
    vim.api.nvim_create_user_command("GotoLeftWindow", require("smart-splits").move_cursor_left, {})
    vim.api.nvim_create_user_command(
        "GotoRightWindow",
        require("smart-splits").move_cursor_right,
        {}
    )
    vim.api.nvim_create_user_command("GotoUpWindow", require("smart-splits").move_cursor_up, {})
    vim.api.nvim_create_user_command("GotoDownWindow", require("smart-splits").move_cursor_down, {})

    vim.api.nvim_create_user_command(
        "StartResizeMode",
        require("smart-splits").start_resize_mode,
        {}
    )

    vim.api.nvim_create_user_command("ResizeWindowLeft", require("smart-splits").resize_left, {})
    vim.api.nvim_create_user_command("ResizeWindowRight", require("smart-splits").resize_right, {})
    vim.api.nvim_create_user_command("ResizeWindowUp", require("smart-splits").resize_up, {})
    vim.api.nvim_create_user_command("ResizeWindowDown", require("smart-splits").resize_down, {})
end
return M

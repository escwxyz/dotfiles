--- Git Related Utils (Gitsigns & Lazygit)
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/lewis6991/gitsigns.nvim

return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup({
            signs                        = {
                add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                change       = { hl = 'GitSignsChange', text = '▒', numhl = 'GitSignsChangeNr',
                    linehl = 'GitSignsChangeLn' },
                delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr',
                    linehl = 'GitSignsDeleteLn' },
                topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr',
                    linehl = 'GitSignsDeleteLn' },
                changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr',
                    linehl = 'GitSignsChangeLn' },
                untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            },
            signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked          = true,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil, -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm                         = {
                enable = false
            },
            on_attach                    = function(bufnr)
                local gitsigns = package.loaded.gitsigns
                -- local Terminal = require("toggleterm.terminal").Terminal
                local Hydra = require("hydra")
                local cmd = require('hydra.keymap-util').cmd

                -- local Lazygit = Terminal:new({
                --     cmd = "lazygit",
                --     hidden = true,
                --     direction = "float",
                --     float_opts = {
                --         border = "curved"
                --     }
                -- })
                local hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
 ^
 ^ ^              _<Enter>_: Lazygit              _<Esc>_: exit
]]

                Hydra({
                    name = 'Git',
                    hint = hint,
                    config = {
                        buffer = bufnr,
                        color = 'pink',
                        invoke_on_body = true,
                        hint = {
                            border = 'rounded'
                        },
                        on_enter = function()
                            vim.cmd 'mkview'
                            vim.cmd 'silent! %foldopen!'
                            vim.bo.modifiable = false
                            gitsigns.toggle_signs(true)
                            gitsigns.toggle_linehl(true)
                        end,
                        -- TODO
                        on_exit = function()
                            --local cursor_pos = vim.api.nvim_win_get_cursor(0)
                            -- vim.cmd 'loadview'
                            -- vim.api.nvim_win_set_cursor(0, cursor_pos)
                            -- vim.cmd 'normal zv'
                            gitsigns.toggle_signs(false)
                            gitsigns.toggle_linehl(false)
                            gitsigns.toggle_deleted(false)
                        end,
                    },
                    mode = { 'n', 'x' },
                    body = '<leader>g',
                    heads = {
                        { 'J',
                            function()
                                if vim.wo.diff then return ']c' end
                                vim.schedule(function() gitsigns.next_hunk() end)
                                return '<Ignore>'
                            end,
                            { expr = true, desc = 'next hunk' } },
                        { 'K',
                            function()
                                if vim.wo.diff then return '[c' end
                                vim.schedule(function() gitsigns.prev_hunk() end)
                                return '<Ignore>'
                            end,
                            { expr = true, desc = 'prev hunk' } },
                        { 's', cmd "Gitsigns stage_hunk", { silent = true, desc = 'stage hunk' } },
                        { 'u', gitsigns.undo_stage_hunk, { desc = 'undo last stage' } },
                        { 'p', gitsigns.preview_hunk, { desc = 'preview hunk' } },
                        { 'd', gitsigns.toggle_deleted, { nowait = true, desc = 'toggle deleted' } },
                        { 'b', gitsigns.blame_line, { desc = 'blame' } },
                        { 'B', function() gitsigns.blame_line { full = true } end, { desc = 'blame show full' } },
                        { '<Enter>', cmd "Lazygit", { exit = true, desc = 'Lazygit' } },
                        { '<Esc>', nil, { exit = true, nowait = true, desc = 'exit' } },
                    }
                })

            end
        })
    end
}

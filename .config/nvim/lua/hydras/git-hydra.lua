local M = {}

local gitsigns = package.loaded.gitsigns
local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_]_: next hunk
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_[_: prev hunk
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⣾⣿⣿⣿⣿⣷⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀_s_: stage hunk
⠀⠀⠀⠀⠀⣠⣿⣿⣿⠙⠛⠿⣿⠿⠿⠿⠿⢿⠿⠛⠋⣿⣿⣿⣄⠀⠀⠀⠀⠀_u_: undo last stage
⠀⠀⠀⠀⢰⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡆⠀⠀⠀⠀_p_: preview hunk
⠀⠀⠀⠀⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠀⠀⠀⠀_d_: toggle deleted
⠀⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀_f_: differ this
⠀⠀⠀⠈⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⠁⠀⠀⠀
⠀⠀⠀⠀⢻⣿⣿⣿⣿⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣿⣿⣿⣿⡟⠀⠀⠀⠀_b_: toggle blame line  
⠀⠀⠀⠀⠀⢻⣿⣦⡈⢿⣿⣿⡏⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀_B_: show full blame
⠀⠀⠀⠀⠀⠀⠙⢿⣷⣄⣀⣀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⠀⠀⠀⠀⠀⠀⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀_<Enter>_: Lazygit
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_<Esc>_: exit
]]

M.init_hydra = function(bufnr)
    return Hydra({
        name = "Git",
        hint = hint,
        config = {
            buffer = bufnr,
            color = "pink",
            invoke_on_body = true,
            hint = {
                border = "rounded"
            },
            on_enter = function()
                vim.cmd "mkview"
                vim.cmd "silent! %foldopen!"
                vim.bo.modifiable = false
                gitsigns.toggle_signs(true)
                gitsigns.toggle_linehl(true)
            end,
            -- TODO
            on_exit = function()
                --local cursor_pos = vim.api.nvim_win_get_cursor(0)
                -- vim.cmd "loadview"
                -- vim.api.nvim_win_set_cursor(0, cursor_pos)
                -- vim.cmd "normal zv"
                gitsigns.toggle_signs(false)
                gitsigns.toggle_linehl(false)
                gitsigns.toggle_deleted(false)
            end,
        },
        mode = { "n", "x" },
        heads = {
            { "]",
                function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gitsigns.next_hunk() end)
                    return "<Ignore>"
                end,
                { expr = true, desc = "next hunk" } },
            { "[",
                function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gitsigns.prev_hunk() end)
                    return "<Ignore>"
                end,
                { expr = true, desc = "prev hunk" } },

            { "s", cmd "Gitsigns stage_hunk", { silent = true, desc = "stage hunk" } },
            { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
            { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
            { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
            { "f", gitsigns.diffthis },
            { "B", function() gitsigns.blame_line { full = true } end },
            { "b", cmd "Gitsigns toggle_current_line_blame", { silent = true } },
            { "<Enter>", cmd "Lazygit", { exit = true, desc = "Lazygit" } },
            { "<Esc>", nil, { exit = true, nowait = true, desc = "exit" } },
        }
    })
end

return M

local M = {}

local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

M.init_hydra = function()
    return Hydra({
        name = "BufferLine",
        config = {
            on_key = function()
                vim.wait(200, function()
                    vim.cmd("redraw")
                end, 30, false)
            end,
        },
        heads = {
            { "h", cmd("BufferLineCyclePrev"), { desc = "go to prev", on_key = false } },
            { "l", cmd("BufferLineCycleNext"), { desc = "go to next", on_key = false } },

            { "H", cmd("BufferLineMovePrev"), { desc = "move to prev" } },
            { "L", cmd("BufferLineMoveNext"), { desc = "move to next" } },

            { "p", cmd("BufferLineTogglePin"), { desc = "(un)pin" } },

            -- { 'd', function() vim.cmd('BufferClose') end, { desc = 'close' } },
            -- { 'c', function() vim.cmd('BufferClose') end, { desc = false } },
            -- { 'q', function() vim.cmd('BufferClose') end, { desc = false } },

            -- { 'od', function() vim.cmd('BufferOrderByDirectory') end, { desc = 'by directory' } },
            -- { 'ol', function() vim.cmd('BufferOrderByLanguage') end, { desc = 'by language' } },
            { "<Esc>", nil, { exit = true } },
        },
    })
end

return M

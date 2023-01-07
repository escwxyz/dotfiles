local M = {}

local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

M.t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local yanky_hydra = Hydra({
    name = "Yank",
    mode = "n",
    config = {
        hint = {
            border = "rounded",
            position = "bottom",
        },
    },
    hint = require("hydras.hints").yanky_hint,
    heads = {
        { "h", cmd("YankyRingHistory"), { desc = "History", exit = true } },
        {
            "r",
            function()
                local hydra = require("hydras.yanky-ring-hydra").init_ring_hydra()
                hydra:activate()
            end,
            { desc = "Ring", exit = true },
        },
        { "q", nil, { desc = "quit", exit = true } },
    },
})

M.init_hydra = function()
    return yanky_hydra
end

return M

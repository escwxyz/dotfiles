local M = {}
local Hydra = require("hydra")
-- for yanky picker <leader>y
local yanky_ring_hydra = Hydra({
    mode = "n",
    heads = {
        { "p", "<Plug>(YankyPutAfter)", { desc = "paste after cursor" } },
        { "P", "<Plug>(YankyPutBefore)", { desc = "paste before cursor" } },
        { "<Left>", "<Plug>(YankyCycleBackward)", { private = true, desc = "⮜ " } }, --TODO icons
        { "<Right>", "<Plug>(YankyCycleForward)", { private = true, desc = "⮞" } },
        {
            "<BS>",
            function()
                local hydra = require("hydras.yanky-hydra").init_hydra()
                hydra:activate()
            end,
            { exit = true, desc = "go back" },
        },
        { "<Esc>", nil, { exit = true, desc = "quit" } },
    },
})

M.init_ring_hydra = function()
    return yanky_ring_hydra
end
-- for directly invoking
M.init_hydra = function()
    return Hydra({
        mode = "n",
        heads = {
            { "p", "<Plug>(YankyPutAfter)", { desc = "paste after cursor" } },
            { "P", "<Plug>(YankyPutBefore)", { desc = "paste before cursor" } },
            { "<Left>", "<Plug>(YankyCycleBackward)", { private = true, desc = "⮜ " } }, --TODO icons
            { "<Right>", "<Plug>(YankyCycleForward)", { private = true, desc = "⮞" } },
            { "<Esc>", nil, { exit = true, desc = "quit" } },
        },
    })
end

return M

local M = {}

local Hydra = require("hydra")

local harpoon = Hydra({
    name = "Harpoon",
    config = {
        hint = false,
    },
    mode = "n",
    heads = {
        {
            "m",
            function()
                require("harpoon.marks").add_file()
                vim.notify("Marked")
            end,
            { desc = "mark", exit = true },
        },
        { "p", require("harpoon.ui").nav_prev, { desc = "prev", exit = false } },
        { "n", require("harpoon.ui").nav_next, { desc = "next", exit = false } },
        { "<Enter>", require("harpoon.ui").toggle_quick_menu, { desc = "menu", exit = true } },
        { "q", nil, { desc = "quit", exit = true } },
    },
})

M.activate = function()
    harpoon:activate()
end

return M

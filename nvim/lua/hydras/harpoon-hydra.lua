local M = {}

local Hydra = require("hydra")

M.init_hydra = function()
    return Hydra({
        name = "Harpoon",
        config = {
            color = 'teal',
            invoke_on_body = true,
            hint = {
                position = 'bottom',
                border = 'rounded',
            },
        },
        hint = require("hydras.hints").harpoon_hint,
        mode = "n",
        body = "<leader>h",
        heads = {
            { "m", require("harpoon.mark").add_file, { desc = "Mark Current Buffer", exit = true } }, -- TODO with notification feedback
            { "p", require("harpoon.ui").nav_prev, { exit = false } },
            { "n", require("harpoon.ui").nav_next, { exit = false } },
            { "<Enter>", require("harpoon.ui").toggle_quick_menu, { desc = "Menu", exit = true } },
            { "<Esc>", nil, { exit = true } }

        }
    })
end

return M

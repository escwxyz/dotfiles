local M = {}

local Hydra = require("hydra")

M.init_hydra = function()
    return Hydra({
        name = "Trouble",
        config = {
            hint = {
                type = "statusline"
            }
        },
        mode = "n",
        body = "t",
        heads = {
            { "<Enter>", "<cmd>TroubleToggle<CR>", { desc = "toggle trouble" } },
            { "]", function()
                require("trouble").next({ skip_groups = true, jump = true })
            end, { desc = "next trouble" } },
            { "[", function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end, { desc = "previous trouble" } },
            { "<Esc>", nil, { desc = "exit", exit = true, nowait = true } }
        }
    })
end

return M

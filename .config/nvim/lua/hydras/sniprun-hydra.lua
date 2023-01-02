local M = {}

local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

M.init_hydra = function()
    return Hydra({
        name = "SnipRun",
        config = {
            hint = {
                type = "statusline"
            }
        },
        mode = { "n", "v" },
        body = "<leader>r",
        heads = {
            { "l", cmd "SnipRun", { desc = "run code line", exit = true } },
            { "b", cmd "'<,'>SnipRun", { desc = "run code block", exit = true } }
        }
    })
end

return M

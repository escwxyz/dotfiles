local M = {}

local Hydra = require("hydra")

M.init_hydra = function()
    return Hydra({
        name = "Todo",
        config = {
            invoke_on_body = true,
            hint = {
                type = "statusline"
            },
        },
        mode = { "n", "v" },
        body = "<S-t>",
        heads = {
            { "p", require("todo-comments").jump_prev, { desc = "prev" } },
            { "n", require("todo-comments").jump_next, { desc = "next" } },
            { "<Esc>", nil, { exit = true } }
        }
    })
end

return M

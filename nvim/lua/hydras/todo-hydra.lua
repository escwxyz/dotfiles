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
        body = "<A-t>",
        heads = {
            { "[", require("todo-comments").jump_prev, { desc = "prev" } },
            { "]", require("todo-comments").jump_next, { desc = "next" } },
            { "<Esc>", nil, { exit = true } }
        }
    })
end

return M

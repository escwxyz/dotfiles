local M = {}

local Hydra = require("hydra")

M.init_hydra = function()
    return Hydra({
        name = "Telescope",
        hint = require("hydras.hints").telescope_hint,
        config = {
            color = "teal",
            invoke_on_body = true,
            hint = {
                position = "middle",
                border = "rounded",
            },
        },
        mode = "n",
        body = "<leader>f",
        heads = {
            { "f", "<leader>ff", { remap = true } },
            { "r", "<leader>fr", { remap = true } },
            { "t", "<leader>ft", { remap = true } },
            { "a", "<leader>fa", { remap = true } },
            { "g", "<leader>fg", { remap = true } },
            { "h", "<leader>fh", { remap = true } },
            { "m", "<leader>fm", { remap = true } },
            { "k", "<leader>fk", { remap = true } },
            { "o", "<leader>fo", { remap = true } },
            { "b", "<leader>fb", { remap = true } },
            { "n", "<leader>fn", { remap = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
        },
    })
end

return M

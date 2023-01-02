local M = {}

-- TODO toggle one block

local Hydra = require("hydra")

-- vim.keymap.set("n", "zo", require("ufo").openAllFolds, { silent = true, desc = "Open All Folds" })
-- vim.keymap.set("n", "zc", require("ufo").closeAllFolds, { silent = true, desc = "Close All Folds" })

-- vim.keymap.set("n", "zz", function()

-- end)

M.init_hydra = function()
    return Hydra({
        name = "UFO",
        config = {
            invoke_on_body = true,
            hint = {
                type = "statusline"
            },
        },
        mode = "n",
        body = "z",
        -- hint = [[_O_: open folds _C_: close folds _<Esc>_: exit]],
        heads = {
            { "O", require("ufo").openAllFolds, { desc = "Open All Folds" } },
            { "C", require("ufo").closeAllFolds, { desc = "Close All Folds" } },
            { "<Esc>", nil, { exit = true } }
        }

    })

end

return M

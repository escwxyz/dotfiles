--- Split code
--- ~~~~~~~~~~
--- https://github.com/Wansmer/treesj
return {
    "Wansmer/treesj",
    keys = {
        "sj",
    },
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
        })

        local Hydra = require("hydra")
        local cmd = require("hydra.keymap-util").cmd

        -- local hint = [[_s_: split _j_: join _t_: toggle]]

        Hydra({
            name = "Treesj",
            mode = "n",
            -- hint = hint,
            config = {
                color = "blue",
                hint = {
                    type = "statusline"
                },
            },
            body = "sj",
            heads = {
                { "s", cmd "TSJSplit", { desc = "split" } },
                { "j", cmd "TSJJoin", { desc = "join" } },
                { "t", cmd "TSJToggle", { desc = "toggle" } }
            }
        })
    end
}

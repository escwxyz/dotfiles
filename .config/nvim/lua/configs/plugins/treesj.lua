--- Split code
--- ~~~~~~~~~~
--- https://github.com/Wansmer/treesj
return {
    "Wansmer/treesj",
    event = "BufReadPre",
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
        })

        local Hydra = require("hydra")
        local cmd = require("hydra.keymap-util").cmd

        Hydra({
            name = "Treesj",
            mode = "n",
            config = {
                color = "blue",
                hint = {
                    type = "statusline"
                }
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

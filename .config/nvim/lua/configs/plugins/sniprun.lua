--- Code Runner
--- ~~~~~~~~~~~
--- https://michaelb.github.io/sniprun/sources/README.html#

return {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    keys = {
        "<leader>r"
    },
    config = function()
        require("sniprun").setup({
            -- TODO setup interpreters (need to be installed locally first)
            interpreter_options = {
                Rust_original = {
                    compiler = "rustc"
                }
            }
        })

        -- Keymapping

        local Hydra = require("hydra")
        local cmd = require("hydra.keymap-util").cmd

        Hydra({
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
}

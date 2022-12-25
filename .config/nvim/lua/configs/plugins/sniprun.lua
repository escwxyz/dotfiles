--- Code Runner
--- ~~~~~~~~~~~
--- https://michaelb.github.io/sniprun/sources/README.html#

local M = {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    event = "VeryLazy",
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
        -- TODO
        local key_map = require("nvim-mapper")
        key_map.map("n", "<S-r>", "<cmd>:SnipRun<cr>", {}, "SnipRun", "run_code_line", "[R]un one line of code")
        key_map.map("v", "<S-r>", "<cmd>:'<,'>SnipRun<cr>", {}, "SnipRun", "run_code_block", "[R]un one block of code")

    end
}

return M

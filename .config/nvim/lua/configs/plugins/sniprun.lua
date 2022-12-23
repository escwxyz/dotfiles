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
        vim.keymap.set("n", "<A-r>", "<cmd>:SnipRun<cr>", { desc = "[R]un code (line)" })
        vim.keymap.set("v", "<A-r>", "<cmd>:'<,'>SnipRun<cr>", { desc = "[R]un code (block)" })

    end
}

return M

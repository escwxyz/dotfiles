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

        require("hydras.sniprun-hydra").init_hydra()
    end
}

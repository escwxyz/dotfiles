--- Code Runner
--- ~~~~~~~~~~~
--- https://michaelb.github.io/sniprun/sources/README.html#

local M = {}

M.setup = function()
    require("sniprun").setup({
        -- TODO setup interpreters (need to be installed locally first)
        interpreter_options = {
            Rust_original = {
                compiler = "rustc",
            },
        },
    })
end

return M

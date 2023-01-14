return {
    name = "Cargo Build",
    builder = function()
        local file = vim.fn.expand("%:p")
        return {
            cmd = { "cargo build" },
            args = file,
        }
    end,
    condition = {
        filetype = { "rust" }
    }
}

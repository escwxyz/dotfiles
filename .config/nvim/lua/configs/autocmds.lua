--add cmp supportforcargo.toml
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        require("cmp").setup.buffer({ sources = { { name = "crates" } } })
    end,
})

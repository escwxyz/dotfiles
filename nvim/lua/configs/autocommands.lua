-- local sad = require("utils").sad

--add cmp supportforcargo.toml
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        local ok, cmp = pcall(require, "cmp")
        if not ok then
            return
        end
        cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
})
-- -- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = "*",
})
-- TODO
-- Alacritty Padding TODO need to check if its main nvim (conflicts when open nvim inside fterm)
-- local alacritty_path = "~/.config/alacritty/alacritty.yml"
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         sad("51", 20, 0, alacritty_path)
--         sad("52", 20, 0, alacritty_path)
--     end,
--     pattern = "*",
--     group = vim.api.nvim_create_augroup("ChangeAlacrittyPadding", { clear = true }),
-- })
--
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--     callback = function()
--         sad("51", 0, 20, alacritty_path)
--         sad("52", 0, 20, alacritty_path)
--     end,
--     pattern = "*",
--     group = vim.api.nvim_create_augroup("ChangeAlacrittyPadding", { clear = false }),
-- })
-- UpTime
-- vim.api.nvim_create_autocmd("UIEnter", {
--     callback = function()
--         vim.g.init_time = os.time()
--     end,
--     pattern = "*",
--     group = vim.api.nvim_create_augroup("UpTime", { clear = true }),
-- })
--
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--     callback = function()
--         vim.g.init_time = nil
--     end,
--     pattern = "*",
--     group = vim.api.nvim_create_augroup("UpTime", { clear = false }),
-- })

vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        vim.notify("Buffer saved")
    end,
})

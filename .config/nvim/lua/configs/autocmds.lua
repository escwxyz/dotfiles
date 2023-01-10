--add cmp supportforcargo.toml
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        require("cmp").setup.buffer({ sources = { { name = "crates" } } })
    end,
})
-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = "*",
})
-- Alacritty Padding
local function sad(line_nr, from, to, fname)
    vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname))
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        sad("51", 20, 0, "~/.config/alacritty/alacritty.yml")
        sad("52", 20, 0, "~/.config/alacritty/alacritty.yml")
    end,
    pattern = "*",
    group = vim.api.nvim_create_augroup("ChangeAlacrittyPadding", { clear = true }),
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        sad("51", 0, 20, "~/.config/alacritty/alacritty.yml")
        sad("52", 0, 20, "~/.config/alacritty/alacritty.yml")
    end,
    pattern = "*",
    group = vim.api.nvim_create_augroup("ChangeAlacrittyPadding", { clear = false }),
})
-- UpTime
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        _G.init_time = os.time()
    end,
    pattern = "*",
    group = vim.api.nvim_create_augroup("UpTime", { clear = true }),
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        _G.init_time = nil
    end,
    pattern = "*",
    group = vim.api.nvim_create_augroup("UpTime", { clear = false }),
})

-- Theme
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        require("configs.themes").save_theme(vim.g.Theme)
    end,
    pattern = "*",
    group = vim.api.nvim_create_augroup("Theme", { clear = true }),
})
-- Heirline
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        require("plugins.heirline").on_colorscheme()
    end,
    group = vim.api.nvim_create_augroup("Heirline", { clear = true }),
})

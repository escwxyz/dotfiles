-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "git@github.com:folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- load lazy
require("lazy").setup("configs.plugins", {
    defaults = {
        lazy = true, -- lazily load all plugins
        version = "*" -- install the latest stable version of plugins
    },
    install = { missing = true },
    checker = {
        enabled = true,
        notify = true,
        frequency = 7200 -- check updates every 2 hours
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath("state") .. "/lazy/cache", -- TODO
        },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrw",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    debug = false,
})

local key_map = require("nvim-mapper")

key_map.map("n", "<leader>l", "<cmd>:Lazy<cr>", {}, "Lazy", "lazy", "Show [L]azy Panel")
key_map.map("n", "<leader>ls", "<cmd>:Lazy sync<cr>", {}, "Lazy", "lazy_sync", "[L]azy [S]ync Plugins")
key_map.map("n", "<leader>lc", "<cmd>:Lazy check<cr>", {}, "Lazy", "lazy_check", "[L]azy [C]heck Plugins")

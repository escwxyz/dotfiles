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

require("lazy").setup("configs.plugins", {
    defaults = {
        lazy = true, -- lazily load all plugins
        version = "*" -- install the latest stable version of plugins
    },
    install = { missing = true },
    checker = {
        enabled = true,
        notify = true,
        frequency = 3600 * 6
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

require("configs.globals")

local plugins_path = vim.fn.stdpath("data") .. "/lazy"

local lazy_path = plugins_path .. "/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })
end

vim.opt.runtimepath:prepend(lazy_path)
local plugins = {
    { "nvim-lua/plenary.nvim", lazy = false },
}

local config_path = vim.fn.stdpath("config")

local plugins_dir = config_path .. "/lua/plugins"

if vim.loop.fs_stat(plugins_dir) then
    for file in vim.fs.dir(plugins_dir) do
        local pattern = "^(.*)%.lua$"
        local config_file = file:match(pattern)
        if config_file then
            plugins[#plugins + 1] = require("plugins." .. config_file)
        elseif
            vim.fn.filereadable(plugins_dir .. "/" .. file .. "/init.lua") == 1
            or vim.fn.filereadable(plugins_dir .. "/" .. file .. "/init.fnl") == 1
        then
            plugins[#plugins + 1] = require("plugins." .. file)
        end
    end
end

local lazy_config = {
    defaults = {
        lazy = true,
        version = "*",
    },
    spec = plugins,
    install = { missing = true },
    ui = {
        border = "rounded",
        -- TODO load icons from configs.icons
        icons = {
            loaded = "Y",
            not_loaded = "N",
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            keys = " ",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔",
            lazy = "鈴 ",
            list = { "●", "➜", "★", "‒" },
        },
    },
    checker = {
        enabled = true,
        notify = false,
        frequency = 3600 * 12,
    },
    change_detection = {
        enabled = true,
        notify = true,
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath("cache") .. "/lazy/cache",
            disable_events = { "VimEnter", "BufReadPre" },
            ttl = 3600 * 24 * 5,
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
                "shada",
            },
        },
    },
}

require("lazy").setup(lazy_config)

require("configs")

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

if vim.g.UseFennel then
    local hotpot_path = plugins_path .. "/hotpot.nvim"

    if not vim.loop.fs_stat(hotpot_path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--single-branch",
            "https://github.com/rktjmp/hotpot.nvim.git",
            hotpot_path,
        })
    end

    vim.opt.runtimepath:prepend(hotpot_path)

    local themis_path = plugins_path .. "/themis.nvim"

    if not vim.loop.fs_stat(themis_path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--single-branch",
            "https://github.com/datwaft/themis.nvim.git",
            themis_path,
        })
    end

    vim.opt.runtimepath:prepend(themis_path)

    require("hotpot").setup({
        provide_require_fennel = true,
        compiler = {
            modules = {
                correlate = true,
            },
        },
    })
end

local plugins = vim.g.UseFennel
        and {
            {
                "rktjmp/hotpot.nvim",
                dependencies = { "datwaft/themis.nvim" },
            },
            "nvim-tree/nvim-web-devicons",
            { "nvim-lua/plenary.nvim", lazy = false },
        }
    or {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-lua/plenary.nvim", lazy = false },
    }

local config_path = vim.fn.stdpath("config")

local plugins_dir = vim.g.UseFennel and (config_path .. "/fnl/plugins")
    or (config_path .. "/lua/plugins")

if vim.loop.fs_stat(plugins_dir) then
    for file in vim.fs.dir(plugins_dir) do
        local pattern = vim.g.UseFennel and "^(.*)%.fnl$" or "^(.*)%.lua$"
        local config_file = file:match(pattern)
        if config_file then -- if it's .lua or .fnl file,
            plugins[#plugins + 1] = require("plugins." .. config_file)
        elseif
            vim.fn.filereadable(plugins_dir .. "/" .. file .. "/init.lua")
            or vim.fn.filereadable(plugins_dir .. "/" .. file .. "/init.fnl")
        then
            plugins[#plugins + 1] = require("plugins." .. file)
        end
    end
end

-- add aditional folders to the plugins table
-- plugins[#plugins + 1] = require("plugins.heirline")
-- plugins[#plugins + 1] = require("plugins.lsp")

local lazy_config = {
    defaults = {
        lazy = true,
        version = "*",
    },
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
    -- NOTE this seems not to work as expected if using the current structure
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

require("lazy").setup(plugins, lazy_config)

require("configs")

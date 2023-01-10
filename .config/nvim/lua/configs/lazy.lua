local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- where to install lazy.nvim
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

vim.opt.rtp:prepend(lazypath)

local lazy_config = {
    defaults = {
        lazy = true,
        version = "*", -- install the latest stable version of plugins
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
        notify = true,
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
            },
        },
    },
}

require("lazy").setup({

    -- ██████╗░░█████╗░░██████╗██╗░█████╗░
    -- ██╔══██╗██╔══██╗██╔════╝██║██╔══██╗
    -- ██████╦╝███████║╚█████╗░██║██║░░╚═╝
    -- ██╔══██╗██╔══██║░╚═══██╗██║██║░░██╗
    -- ██████╦╝██║░░██║██████╔╝██║╚█████╔╝
    -- ╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░╚════╝░

    "nvim-tree/nvim-web-devicons",

    "nvim-lua/plenary.nvim",

    -- ██╗░░░░░░██████╗██████╗░
    -- ██║░░░░░██╔════╝██╔══██╗
    -- ██║░░░░░╚█████╗░██████╔╝
    -- ██║░░░░░░╚═══██╗██╔═══╝░
    -- ███████╗██████╔╝██║░░░░░
    -- ╚══════╝╚═════╝░╚═╝░░░░░

    {
        "jose-elias-alvarez/null-ls.nvim",
        name = "null_ls",
        event = "InsertEnter",
        config = function()
            require("plugins.lsp.null_ls").setup()
        end,
    },

    {
        "rmagatti/goto-preview",
        name = "goto_preview",
        keys = { "gp" },
        config = function()
            require("plugins.lsp.goto_preview").setup()
        end,
    },

    {
        "neovim/nvim-lspconfig",
        name = "lsp_config",
        event = "BufReadPre", -- NOTE improper event leading to unexpected behavior
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "smjonas/inc-rename.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
            "ray-x/lsp_signature.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("plugins.lsp.lsp_config").setup()
        end,
    },

    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        conifg = function()
            require("plugins.lsp.rust_tools").setup()
        end,
    },

    {
        "jose-elias-alvarez/typescript.nvim",
        ft = { "typescript", "javascript", "typescriptreact" },
        config = function()
            require("plugins.lsp.typescript").setup()
        end,
    },

    {
        "akinsho/flutter-tools.nvim",
        ft = "dart",
        config = function()
            require("plugins.lsp.flutter_tools").setup()
        end,
    },

    -- ██╗░░░██╗██╗
    -- ██║░░░██║██║
    -- ██║░░░██║██║
    -- ██║░░░██║██║
    -- ╚██████╔╝██║
    -- ░╚═════╝░╚═╝

    {
        "stevearc/dressing.nvim",
        name = "dressing",
        lazy = false,
        config = function()
            require("plugins.dressing").setup()
        end,
    },

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.catppuccin").setup()
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.indent_blankline").setup()
        end,
    },

    -- █▄░█ █▀█ ▀█▀ █ █▀▀ █▄█
    -- █░▀█ █▄█ ░█░ █ █▀░ ░█░
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require("plugins.notify").setup()
        end,
    },

    {
        "SmiteshP/nvim-navic",
        event = "VeryLazy",
        config = function()
            require("plugins.navic").setup()
        end,
    },

    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        config = function()
            require("plugins.mini_animate").setup()
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
        name = "lualine",
        event = "VeryLazy",
        config = function()
            require("plugins.lualine").setup()
        end,
    },

    {
        "rebelot/heirline.nvim",
        enabled = true,
        name = "heirline",
        event = "VeryLazy",
        config = function()
            require("plugins.heirline").setup()
            require("plugins.heirline").setup_colors()
        end,
    },

    {
        "folke/noice.nvim",
        enabled = true,
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.noice").setup()
        end,
    },

    -- ████████╗░█████╗░░█████╗░██╗░░░░░░██████╗
    -- ╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝
    -- ░░░██║░░░██║░░██║██║░░██║██║░░░░░╚█████╗░
    -- ░░░██║░░░██║░░██║██║░░██║██║░░░░░░╚═══██╗
    -- ░░░██║░░░╚█████╔╝╚█████╔╝███████╗██████╔╝
    -- ░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝╚═════╝░

    "anuvyklack/hydra.nvim",

    {
        "Nexmean/caskey.nvim",
        lazy = false,
        -- event = "VeryLazy",
        config = function()
            require("caskey.wk").setup(require("configs.mappings"))
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        conifg = function()
            require("plugins.which_key").setup()
        end,
    },

    {
        "mrjones2014/legendary.nvim",
        event = "VeryLazy", -- NOTE to ensure it's loaded before whichkey set the keymaps; or can set manually, wait for caskey's support
        config = function()
            require("plugins.legendary").setup()
        end,
    },

    {
        "axieax/urlview.nvim",
        name = "urlview",
        cmd = "UrlView",
        config = function()
            require("plugins.urlview").setup()
        end,
    },

    { "williamboman/mason.nvim", lazy = false, config = true },

    {
        "saecki/crates.nvim",
        lazy = false, -- NOTE cond only works when lazy is false
        cond = function()
            local buf = vim.api.nvim_buf_get_name(0)
            if string.sub(buf, -10) == "Cargo.toml" then
                return true
            end
            return false
        end,
        config = true,
    },

    {
        "gbprod/yanky.nvim",
        event = "VeryLazy",
        dependencies = "kkharji/sqlite.lua",
        config = function()
            require("plugins.yanky").setup()
        end,
    },

    {
        "sindrets/winshift.nvim",
        name = "winshift",
        cmd = {
            "WinShift",
        },
        config = function()
            require("plugins.windows.winshift").setup()
        end,
    },

    {
        "anuvyklack/windows.nvim",
        name = "windows",
        dependencies = {
            { "anuvyklack/middleclass" },
            { "anuvyklack/animation.nvim", name = "animation" },
        },
        cmd = {
            "WindowsMaximize",
            "WindowsMaximizeVertically",
            "WindowsMaximizeHorizontally",
            "WindowsEqualize",
        },
        config = function()
            require("plugins.windows.windows").setup()
        end,
    },

    {
        "mrjones2014/smart-splits.nvim",
        name = "smart_splits",
        cmd = {
            "GotoLeftWindow",
            "GotoRightWindow",
            "GotoDownWindow",
            "GotoUpWindow",
            "StartResizeMode",
            "ResizeWindowLeft",
            "ResizeWindowDown",
            "ResizeWindowRight",
            "ResizeWindowUp",
        },
        config = function()
            require("plugins.windows.smart_splits").setup()
            require("plugins.windows.smart_splits").setup_cmd()
        end,
    },

    -- ░█████╗░░█████╗░██████╗░██╗███╗░░██╗░██████╗░
    -- ██╔══██╗██╔══██╗██╔══██╗██║████╗░██║██╔════╝░
    -- ██║░░╚═╝██║░░██║██║░░██║██║██╔██╗██║██║░░██╗░
    -- ██║░░██╗██║░░██║██║░░██║██║██║╚████║██║░░╚██╗
    -- ╚█████╔╝╚█████╔╝██████╔╝██║██║░╚███║╚██████╔╝
    -- ░╚════╝░░╚════╝░╚═════╝░╚═╝╚═╝░░╚══╝░╚═════╝░

    {
        "max397574/better-escape.nvim",
        name = "better_escape",
        event = "ModeChanged",
        config = function()
            require("plugins.better_escape").setup()
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        name = "refactoring",
        cmd = "Refactor",
        config = function()
            require("plugins.refactoring").setup()
            require("plugins.refactoring").setup_cmds()
        end,
    },

    {
        "ckolkey/ts-node-action",
        name = "ts_node_action",
        cmd = { "NodeAction" },
        config = function()
            require("plugins.ts_node_action").setup()
            require("plugins.ts_node_action").setup_cmds()
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-cmdline",
        },
        event = { "CmdlineEnter", "InsertEnter" },
        config = function()
            require("plugins.cmp").setup()
        end,
    },

    {
        "echasnovski/mini.comment",
        name = "mini_comment",
        keys = { { "gc", mode = { "n", "x" } }, { "gcc" } },
        dependencies = {
            { "JoosepAlviste/nvim-ts-context-commentstring", name = "ts_ctx_commentstring" },
        },
        config = function()
            require("plugins.mini_comment").setup()
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async", name = "promise_async" },
        name = "ufo",
        keys = { { "zf" } },
        config = function()
            require("plugins.ufo").setup()
            require("plugins.ufo").setup_cmds()
        end,
    },

    {
        "echasnovski/mini.ai",
        name = "mini_ai",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                name = "ts_textobjects",
                init = function()
                    -- no need to load the plugin, since we only need its queries
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                end,
            },
        },
        keys = { { "a", mode = { "x", "o" } }, { "i", mode = { "x", "o" } } },
        config = function()
            require("plugins.mini_ai").setup()
        end,
    },

    -- luasnip
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("plugins.luasnip").setup()
        end,
    },
    -- leap
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
            "ggandor/flit.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("plugins.leap").setup()
        end,
    },
    -- gomove
    {
        "booperlv/nvim-gomove",
        event = "VeryLazy",
        config = function()
            require("plugins.gomove").setup()
        end,
    },

    -- mini pairs
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        config = function()
            require("plugins.mini_pairs").setup()
        end,
    },

    -- neogen anotation
    {
        "danymat/neogen",
        enabled = false,
        event = "InsertEnter",
        config = true,
    },

    -- surround
    {
        "echasnovski/mini.surround",
        name = "mini_surround",
        keys = {
            "ms", -- [m]ini [s]urround
        },
        config = function()
            require("plugins.mini_surround").setup()
        end,
    },

    -- todo_comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.todo_comments").setup()
        end,
    },

    -- ███████╗██████╗░██╗████████╗░█████╗░██████╗░
    -- ██╔════╝██╔══██╗██║╚══██╔══╝██╔══██╗██╔══██╗
    -- █████╗░░██║░░██║██║░░░██║░░░██║░░██║██████╔╝
    -- ██╔══╝░░██║░░██║██║░░░██║░░░██║░░██║██╔══██╗
    -- ███████╗██████╔╝██║░░░██║░░░╚█████╔╝██║░░██║
    -- ╚══════╝╚═════╝░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝

    -- ███████╗███╗░░██╗██╗░░██╗░█████╗░███╗░░██╗░█████╗░███████╗███╗░░░███╗███████╗███╗░░██╗████████╗
    -- ██╔════╝████╗░██║██║░░██║██╔══██╗████╗░██║██╔══██╗██╔════╝████╗░████║██╔════╝████╗░██║╚══██╔══╝
    -- █████╗░░██╔██╗██║███████║███████║██╔██╗██║██║░░╚═╝█████╗░░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░
    -- ██╔══╝░░██║╚████║██╔══██║██╔══██║██║╚████║██║░░██╗██╔══╝░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░
    -- ███████╗██║░╚███║██║░░██║██║░░██║██║░╚███║╚█████╔╝███████╗██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░
    -- ╚══════╝╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚════╝░╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░

    -- █▀█ █░█ █ █▀▀ █▄▀ █▀▀ █ ▀▄▀
    -- ▀▀█ █▄█ █ █▄▄ █░█ █▀░ █ █░█
    {
        "kevinhwang91/nvim-bqf",
        enabled = false,
        keys = {
            "<leader>q",
        },
        ft = "qf",
        config = function()
            require("plugins.bqf").setup()
        end,
    },

    -- fterm
    {
        "numToStr/FTerm.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.fterm").setup()
        end,
    },

    -- dap
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
        keys = {
            {
                "<leader>d",
                function()
                    local hydra = require("hydras.debug-hydra").init_hydra()
                    hydra:activate()
                end,
                desc = "[Hydra] Debug",
            },
        },
        config = function()
            require("plugins.dap").setup()
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.git.gitsigns").setup()
        end,
    },

    {
        "sindrets/diffview.nvim",
        name = "diffview",
        cmd = "DiffviewOpen",
        config = function()
            require("plugins.git.diffview").setup()
        end,
    },

    -- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █ ▀█▀ ▀█▀ █▀▀ █▀█
    -- ░█░ █▀▄ ██▄ ██▄ ▄█ █ ░█░ ░█░ ██▄ █▀▄

    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    { "nvim-treesitter/nvim-treesitter-context", name = "ts_context", event = "VeryLazy" },
    {
        "nvim-treesitter/nvim-treesitter",
        dev = false,
        build = ":TSUpdate",
        event = "BufReadPost",
        config = function()
            require("plugins.treesitter").setup()
        end,
    },

    -- █░█ █▄░█ █▀▄ █▀█ ▀█▀ █▀█ █▀▀ █▀▀
    -- █▄█ █░▀█ █▄▀ █▄█ ░█░ █▀▄ ██▄ ██▄
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = true,
    },

    -- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
    -- ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "cljoly/telescope-repo.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = "<leader>f",
        cmd = "Telescope",
        init = function()
            require("plugins.telescope").init_cmds()
        end,
        config = function()
            require("plugins.telescope").setup()
        end,
    },

    --sniprun
    {
        "michaelb/sniprun",
        build = "bash ./install.sh",
        config = function()
            require("plugins.sniprun").setup()
        end,
    },

    -- overseer jobs
    {
        "stevearc/overseer.nvim",
        config = function()
            require("plugins.overseer").setup()
        end,
    },

    -- █▄░█ █▀▀ █▀█ ▀█▀ █▀▀ █▀ ▀█▀
    -- █░▀█ ██▄ █▄█ ░█░ ██▄ ▄█ ░█░
    {
        "nvim-neotest/neotest",
        dependencies = {
            "antoinemadec/FixCursorHold.nvim",
            "marilari88/neotest-vitest",
            "sidlatau/neotest-dart",
            "rouge8/neotest-rust",
        },
        config = function()
            require("plugins.neotest").setup()
        end,
    },

    -- illuminate
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        enabled = false,
        config = function()
            require("plugins.illuminate").setup()
        end,
    },

    -- █░█ ▄▀█ █▀█ █▀█ █▀█ █▀█ █▄░█
    -- █▀█ █▀█ █▀▄ █▀▀ █▄█ █▄█ █░▀█
    {
        "ThePrimeagen/harpoon",
        keys = "<leader>m",
        config = function()
            require("plugins.harpoon").setup()
        end,
    },

    -- fm
    {
        "is0n/fm-nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.fm").setup()
        end,
    },
}, lazy_config)

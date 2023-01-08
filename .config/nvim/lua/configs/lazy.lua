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
            require("plugins.ui.dressing").setup()
        end,
    },

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.ui.catppuccin").setup()
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.ui.indent_blankline").setup()
        end,
    },

    -- █▄░█ █▀█ ▀█▀ █ █▀▀ █▄█
    -- █░▀█ █▄█ ░█░ █ █▀░ ░█░
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require("plugins.ui.notify").setup()
        end,
    },

    {
        "SmiteshP/nvim-navic",
        event = "VeryLazy",
        config = function()
            require("plugins.ui.navic").setup()
        end,
    },

    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        config = function()
            require("plugins.ui.mini_animate").setup()
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.ui.lualine").setup()
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
            require("plugins.ui.noice").setup()
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
            require("plugins.tool.which_key").setup()
        end,
    },

    {
        "mrjones2014/legendary.nvim",
        event = "VeryLazy", -- NOTE to ensure it's loaded before whichkey set the keymaps; or can set manually, wait for caskey's support
        config = function()
            require("plugins.tool.legendary").setup()
        end,
    },

    {
        "axieax/urlview.nvim",
        name = "urlview",
        cmd = "UrlView",
        config = function()
            require("plugins.tool.urlview").setup()
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
            require("plugins.tool.yanky").setup()
        end,
    },

    {
        "sindrets/winshift.nvim",
        name = "winshift",
        cmd = {
            "WinShift",
        },
        config = function()
            require("plugins.tool.windows.winshift").setup()
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
            require("plugins.tool.windows.windows").setup()
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
            require("plugins.tool.windows.smart_splits").setup()
            require("plugins.tool.windows.smart_splits").setup_cmd()
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
        event = "ModeChanged",
        config = function()
            require("plugins.coding.better_escape").setup()
        end,
    },

    {
        "ckolkey/ts-node-action",
        name = "ts_node_action",
        event = "VeryLazy",
        config = function()
            require("plugins.coding.ts_node_action").setup()
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
            require("plugins.coding.cmp").setup()
        end,
    },

    {
        "echasnovski/mini.comment",
        name = "mini_comment",
        event = "VeryLazy",
        -- keys = { { "cc", mode = { "n", "x" } }, { "ccc" } },
        dependencies = {
            { "JoosepAlviste/nvim-ts-context-commentstring", name = "ts_ctx_commentstring" },
        },
        config = function()
            require("plugins.coding.mini_comment").setup()
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        name = "ufo",
        keys = {
            {
                "z",
                function()
                    local hydra = require("hydras.ufo-hydra").init_hydra()
                    hydra:activate()
                end,
                desc = "[Hydra] UFO",
            },
        },
        config = function()
            require("plugins.coding.ufo").setup()
        end,
    },
    -- mini.ai
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
            require("plugins.coding.mini_ai").setup()
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
            require("plugins.coding.luasnip").setup()
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
            require("plugins.coding.leap").setup()
        end,
    },
    -- gomove
    {
        "booperlv/nvim-gomove",
        event = "VeryLazy",
        config = function()
            require("plugins.coding.gomove").setup()
        end,
    },

    -- mini pairs
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        config = function()
            require("plugins.coding.mini_pairs").setup()
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
        "kylechui/nvim-surround",
        event = "InsertEnter",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- todo_comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.coding.todo_comments").setup()
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
            require("plugins.editor_enhancement.bqf").setup()
        end,
    },

    -- █▄▄ █░█ █▀▀ █▀▀ █▀▀ █▀█ █░░ █ █▄░█ █▀▀
    -- █▄█ █▄█ █▀░ █▀░ ██▄ █▀▄ █▄▄ █ █░▀█ ██▄
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.editor_enhancement.bufferline").setup()
        end,
    },

    -- fterm
    {
        "numToStr/FTerm.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.editor_enhancement.fterm").setup()
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
            require("plugins.editor_enhancement.dap").setup()
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.editor_enhancement.git.gitsigns").setup()
        end,
    },

    {
        "sindrets/diffview.nvim",
        name = "diffview",
        cmd = "DiffviewOpen",
        config = function()
            require("plugins.editor_enhancement.git.diffview").setup()
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
            require("plugins.editor_enhancement.treesitter").setup()
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
            require("plugins.editor_enhancement.telescope").init_cmds()
        end,
        config = function()
            require("plugins.editor_enhancement.telescope").setup()
        end,
    },

    --sniprun
    {
        "michaelb/sniprun",
        build = "bash ./install.sh",
        config = function()
            require("plugins.editor_enhancement.sniprun").setup()
        end,
    },

    -- overseer jobs
    {
        "stevearc/overseer.nvim",
        config = function()
            require("plugins.editor_enhancement.overseer").setup()
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
            require("plugins.editor_enhancement.neotest").setup()
        end,
    },

    -- illuminate
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        enabled = false,
        config = function()
            require("plugins.editor_enhancement.illuminate").setup()
        end,
    },

    -- █░█ ▄▀█ █▀█ █▀█ █▀█ █▀█ █▄░█
    -- █▀█ █▀█ █▀▄ █▀▀ █▄█ █▄█ █░▀█
    {
        "ThePrimeagen/harpoon",
        keys = "<leader>m",
        config = function()
            require("plugins.editor_enhancement.harpoon").setup()
        end,
    },

    -- fm
    {
        "is0n/fm-nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.editor_enhancement.fm").setup()
        end,
    },
}, lazy_config)

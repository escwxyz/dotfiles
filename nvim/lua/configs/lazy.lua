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
                "shada",
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
        cmd = {
            "GotoPreviewDefinition",
            "GotoPreviewTypeDefinition",
            "GotoPreviewImplementation",
            "GotoPreviewReference",
        },
        config = function()
            require("plugins.lsp.goto_preview").setup()
            require("plugins.lsp.goto_preview").setup_cmds()
        end,
    },

    {
        "neovim/nvim-lspconfig",
        name = "lsp_config",
        enabled = true,
        -- event = "BufReadPre", -- NOTE improper event leading to unexpected behavior
        ft = {
            "rust",
            "lua",
            "typescript",
            "tsx",
            "typescriptreact",
            "dart",
            "javascript",
            "css",
        },
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
        "rrethy/nvim-base16",
        name = "base16",
        lazy = false,
        priority = 1000,
        enabled = true,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.indent_blankline").setup()
        end,
    },

    {
        "echasnovski/mini.animate",
        name = "mini_animate",
        event = "VeryLazy",
        config = function()
            require("plugins.mini_animate").setup()
        end,
    },

    {
        "folke/zen-mode.nvim",
        name = "zen_mode",
        cmd = { "StartZenMode" },
        config = function()
            require("plugins.zen_mode").setup()
            require("plugins.zen_mode").setup_cmds()
        end,
    },

    -- █▄░█ █▀█ ▀█▀ █ █▀▀ █▄█
    -- █░▀█ █▄█ ░█░ █ █▀░ ░█░
    {
        "rcarriga/nvim-notify",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.notify").setup()
        end,
    },

    {
        "SmiteshP/nvim-navic",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.navic").setup()
        end,
    },

    {
        "rebelot/heirline.nvim",
        name = "heirline",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.heirline").setup()
        end,
    },

    {
        "tiagovla/scope.nvim",
        enabled = true,
        name = "scope",
        event = "VeryLazy",
        config = true,
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

    {
        "j-hui/fidget.nvim",
        name = "fidget",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.fidget").setup()
        end,
    },

    -- ████████╗░█████╗░░█████╗░██╗░░░░░░██████╗
    -- ╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝
    -- ░░░██║░░░██║░░██║██║░░██║██║░░░░░╚█████╗░
    -- ░░░██║░░░██║░░██║██║░░██║██║░░░░░░╚═══██╗
    -- ░░░██║░░░╚█████╔╝╚█████╔╝███████╗██████╔╝
    -- ░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝╚═════╝░

    {
        "anuvyklack/hydra.nvim",
        name = "hydra",
        lazy = false,
        config = function()
            require("plugins.hydra").setup_cmds()
        end,
    },

    {
        "Nexmean/caskey.nvim",
        name = "caskey",
        enabled = true,
        lazy = false,
        config = function()
            require("caskey.wk").setup(require("configs.mappings"))
        end,
    },

    {
        "folke/which-key.nvim",
        name = "which_key",
        enabled = true,
        lazy = false,
        conifg = function()
            require("plugins.which_key").setup() --TODO whichkey config is not working
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

    {
        "williamboman/mason.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("plugins.mason").setup()
        end,
    },

    {
        "saecki/crates.nvim",
        name = "crates",
        event = "BufReadPost Cargo.toml",
        config = function()
            require("plugins.crates").setup()
            require("plugins.crates").setup_cmds()
        end,
    },

    {
        "rmagatti/auto-session",
        name = "auto_session",
        cmd = { "Autosession", "SaveSession", "RestoreSession", "DeleteSession" },
        config = function()
            require("plugins.auto_session").setup()
        end,
    },

    {
        "gbprod/yanky.nvim",
        name = "yanky",
        enabled = false,
        event = "VeryLazy",
        config = function()
            require("plugins.yanky").setup()
        end,
    },

    {
        "AckslD/nvim-neoclip.lua",
        name = "neoclip",
        enabled = true,
        dependencies = {
            { "kkharji/sqlite.lua", name = "sqlite" },
        },
        event = "VeryLazy",
        config = function()
            require("plugins.neoclip").setup()
            require("plugins.neoclip").setup_cmds()
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
        enabled = true,
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
        "echasnovski/mini.move",
        name = "mini_move",
        event = "VeryLazy",
        config = function()
            require("plugins.mini_move").setup()
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
        enabled = true,
        Dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                name = "ts_textobjects",
                config = function()
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
        enabled = true,
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
        enabled = true,
        cmd = { "LeapBuffer", "LeapWindow" },
        config = function()
            require("plugins.leap").setup()
            require("plugins.leap").setup_cmds()
        end,
    },

    -- mini pairs
    {
        "echasnovski/mini.pairs",
        name = "mini_pairs",
        enabled = true,
        event = "InsertEnter",
        config = function()
            require("plugins.mini_pairs").setup()
        end,
    },

    -- neogen anotation
    {
        "danymat/neogen",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.neogen").setup()
        end,
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
        name = "todo_comments",
        enabled = false,
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
        cmd = { "OpenTerminal" },
        config = function()
            require("plugins.fterm").setup()
            require("plugins.fterm").setup_cmds()
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
        name = "gitsigns",
        enabled = true,
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

    { "nvim-treesitter/playground", name = "ts_playground", cmd = "TSPlaygroundToggle" },
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

    {
        "stevearc/aerial.nvim",
        name = "aerial",
        enabled = true,
        event = "VeryLazy", -- it must be loaded for statusline
        -- cmd = {
        --     "AerialToggle",
        --     "AerialOpen",
        --     "AerialOpenAll",
        -- },
        config = function()
            require("plugins.aerial").setup()
        end,
    },

    {
        "mbbill/undotree",
        enabled = false,
        cmd = "UndotreeToggle",
        config = true,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "cljoly/telescope-repo.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        enabled = true,
        keys = "<leader>f",
        cmd = "Telescope",
        config = function()
            require("plugins.telescope").setup()
            require("plugins.telescope").init_cmds()
        end,
    },

    {
        "ibhagwan/fzf-lua",
        name = "fzf",
        cmd = { "FzfLua", "FindProjects" },
        config = function()
            require("plugins.fzf").setup()
            require("plugins.fzf").setup_cmds()
        end,
    },

    {
        "echasnovski/mini.bufremove",
        name = "mini_bufremove",
        cmd = { "BufferRemove" },
        config = function()
            require("plugins.mini_bufremove").setup()
            require("plugins.mini_bufremove").setup_cmds()
        end,
    },

    -- overseer jobs
    {
        "stevearc/overseer.nvim",
        cmd = { "OverseerRun", "OverseerToggle", "OverseerOpen", "OverseerInfo" },
        config = function()
            require("plugins.overseer").setup()
        end,
    },

    -- █▄░█ █▀▀ █▀█ ▀█▀ █▀▀ █▀ ▀█▀
    -- █░▀█ ██▄ █▄█ ░█░ ██▄ ▄█ ░█░
    {
        "nvim-neotest/neotest",
        dependencies = {
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

    {
        "ThePrimeagen/harpoon",
        cmd = { "HydraHarpoon" },
        config = function()
            require("plugins.harpoon").setup()
        end,
    },

    -- fm
    {
        "is0n/fm-nvim",
        name = "fm",
        cmd = { "Nnn", "Gitui" },
        config = function()
            require("plugins.fm").setup()
        end,
    },

    {
        "stevearc/oil.nvim",
        name = "oil",
        cmd = { "Oil" },
        config = function()
            require("plugins.oil").setup()
        end,
    },

    {
        "toppair/peek.nvim",
        name = "peek",
        enabled = false,
        build = "deno task --quiet build:fast",
        ft = { "markdown" },
        opts = require("plugins.peek").opts,
        config = function()
            require("plugins.peek").setup()
        end,
    },
}, lazy_config)

--- Global Keymappings
--- ~~~~~~~~~~~~~~~~~~

-- █░░ ▄▀█ ▀█ █▄█
-- █▄▄ █▀█ █▄ ░█░

local wk = require("which-key")

local general = {
    j = { "v:count == 0 ? 'gj' : 'j'", expr = true },
    k = { "v:count == 0 ? 'gk' : 'k'", expr = true }
}

local leader_normal = {
    b = {
        name = "Buffer",
        ["["] = { "<cmd>BufferLineCyclePrev<CR>", "previous buffer" },
        ["]"] = { "<cmd>BufferLineCycleNext<CR>", "next buffer" },
        p = { "<cmd>BufferLineTogglePin<CR>", "(un)pin buffer" },
        ["<Enter>"] = { require("plugins.bufferline").choose_buffer
            , "[Hydra]" }
    },
    -- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
    -- ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄
    f = {
        name = "Telescope",
        f = { "<cmd>Telescope find_files<CR>", "find files" },
        r = { "<cmd>Telescope repo list search_dirs=~/Projects/<CR>", "find repos" },
        t = { "<cmd>TodoTelescope<CR>", "find todos" },
        g = { "<cmd>Telescope live_grep<CR>", "live grep" },
        h = { "<cmd>Telescope help_tags<CR>", "help tags" },
        k = { "<cmd>Telescope keymaps<CR>", "find keymaps" },
        o = { "<cmd>Telescope vim_options<CR>", "vim options" },
        u = { "<cmd>Telescope undo<CR>", "undo tree" },
        n = { "<cmd>Telescope notify<CR>", "notify history" },
        m = { "<cmd>Telescope harpoon marks<CR>", "harpoon marks" },
        b = { function()
            require("telescope") -- make sure telescope is started
            require("telescope.builtin").current_buffer_fuzzy_find(
                require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end, "search in buffer" },
        a = { "<cmd>Telescope aerial<CR>", "find aerial" }
    },
    g = {
        name = "Git",
        g = { "<cmd>Lazygit<CR>", "Lazygit" }
    },
    l = { "<cmd>Lazy<CR>", "Lazy" },
    n = { "<cmd>Nnn<CR>", "nnn file explorer" },
}

local leader_insert = {
    s = { "<cmd>w<CR>", "save file" }
}

wk.register(general)
wk.register(leader_normal, { prefix = "<leader>" })
wk.register(leader_insert, { prefix = "<leader>", mode = { "n", "i" } })

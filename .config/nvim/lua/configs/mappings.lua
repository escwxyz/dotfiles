--- Global Keymappings
--- ~~~~~~~~~~~~~~~~~~

-- █░░ ▄▀█ ▀█ █▄█
-- █▄▄ █▀█ █▄ ░█░

local wk = require("which-key")

local general = {
    j = { "v:count == 0 ? 'gj' : 'j'", expr = true },
    k = { "v:count == 0 ? 'gk' : 'k'", expr = true },
    ["<A-r>"] = { "<C-r>", "redo" }
}

local leader_normal = {
    b = {
        name = "Buffer",
        ["["] = { "<cmd>BufferLineCyclePrev<CR>", "previous buffer" },
        ["]"] = { "<cmd>BufferLineCycleNext<CR>", "next buffer" },
        p = { "<cmd>BufferLineTogglePin<CR>", "(un)pin buffer" },
        ["<Enter>"] = { function()
            -- TODO require("plugins.ui.plugin_bufferline").choose_buffer
        end, "[Hydra]" },
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
        b = {
            function()
                require("telescope") -- make sure telescope is started
                require("telescope.builtin").current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    })
                )
            end,
            "search in buffer",
        },
        a = { "<cmd>Telescope aerial<CR>", "find aerial" },
    },
    g = {
        function()
            local git = require("hydras.git-hydra").init_hydra()
            git:activate()
        end,
        "Git",
    },

    -- ["gg"] = { "<cmd>Lazygit<CR>", "Lazygit" },

    l = {
        name = "Legendary",
        a = { "<cmd>Legendary autocmds<CR>", "autocmds" },
        c = { "<cmd>Legendary commands<CR>", "commands" },
        f = { "<cmd>Legendary functions<CR>", "functions" },
        k = { "<cmd>Legendary keymaps<CR>", "keymaps" },
        ["<CR>"] = { "<cmd>Legendary<CR>", "keymaps, commands, autocmds" }
    },
    n = { "<cmd>Nnn<CR>", "nnn file explorer" },
    p = { "<cmd>Lazy<CR>", "plugins" },
    s = { "<cmd>w<CR><Esc>", "save file" },
}

local gmove_normal = {

    ["<A-h>"] = { "<Plug>GoNSMLeft", "move left" },
    ["<A-j>"] = { "<Plug>GoNSMDown", "move down" },
    ["<A-k>"] = { "<Plug>GoNSMUp", "move up" },
    ["<A-l>"] = { "<Plug>GoNSMRight", "move right" },
    ["<A-H>"] = { "<Plug>GoNSDLeft", "duplicate left" },
    ["<A-J>"] = { "<Plug>GoNSDDown", "duplicate down" },
    ["<A-K>"] = { "<Plug>GoNSDUp", "duplicate up" },
    ["<A-L>"] = { "<Plug>GoNSDRight", "duplicate right" }

}

local gmove_visual = {

    ["<A-h>"] = { "<Plug>GoVSMLeft", "move left" },
    ["<A-j>"] = { "<Plug>GoVSMDown", "move down" },
    ["<A-k>"] = { "<Plug>GoVSMUp", "move up" },
    ["<A-l>"] = { "<Plug>GoVSMRight", "move right" },
    ["<A-H>"] = { "<Plug>GoVSDLeft", "duplicate left" },
    ["<A-J>"] = { "<Plug>GoVSDDown", "duplicate down" },
    ["<A-K>"] = { "<Plug>GoVSDUp", "duplicate up" },
    ["<A-L>"] = { "<Plug>GoVSDRight", "duplicate right" }

}

wk.register(gmove_normal)
wk.register(gmove_visual, { mode = "v" })

wk.register(general)
wk.register(leader_normal, { prefix = "<leader>" })

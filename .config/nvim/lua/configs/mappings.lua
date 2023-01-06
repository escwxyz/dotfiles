-- Global Keymappings
-- ~~~~~~~~~~~~~~~~~~

-- TODO manage ALL keymaps here

local ck = require("caskey")
local cmd = ck.cmd

return {
    mode = { "n" },

    ["j"] = { act = "v:count == 0 ? 'gj': 'j'", expr = true },
    ["k"] = { act = "v:count == 0 ? 'gk':'k'", expr = true },

    ["H"] = { act = "_", desc = "Head of line" },
    ["L"] = { act = "$", desc = "Last of line" },

    ["<A-r>"] = { act = "<C-r>", desc = "Redo" },

    -- scrolling
    ["<S-u>"] = { act = "<C-u>", desc = "Scroll up" },
    ["<S-d>"] = { act = "<C-d>", desc = "Scroll down" },

    -- Buffer
    ["<Tab>"] = { act = cmd("bnext"), desc = "Next buffer" },
    ["<S-Tab>"] = { act = cmd("bprevious"), desc = "Previous buffer" },

    -- Gomove
    ["<A-h>"] = { act = "<Plug>GoNSMLeft", desc = "Move left" },
    ["<A-j>"] = { act = "<Plug>GoNSMDown", desc = "Move down" },
    ["<A-k>"] = { act = "<Plug>GoNSMUp", desc = "Move up" },
    ["<A-l>"] = { act = "<Plug>GoNSMRight", desc = "Move right" },
    ["<A-H>"] = { act = "<Plug>GoNSDLeft", desc = "Duplicate left" },
    ["<A-J>"] = { act = "<Plug>GoNSDDown", desc = "Duplicate down" },
    ["<A-K>"] = { act = "<Plug>GoNSDUp", desc = "Duplicate up" },
    ["<A-L>"] = { act = "<Plug>GoNSDRight", desc = "Duplicate right" },

    {
        mode = { "x" },

        ["<A-h>"] = { act = "<Plug>GoVSMLeft", desc = "Move left" },
        ["<A-j>"] = { act = "<Plug>GoVSMDown", desc = "Move down" },
        ["<A-k>"] = { act = "<Plug>GoVSMUp", desc = "Move up" },
        ["<A-l>"] = { act = "<Plug>GoVSMRight", desc = "Move right" },
        ["<A-H>"] = { act = "<Plug>GoVSDLeft", desc = "Duplicate left" },
        ["<A-J>"] = { act = "<Plug>GoVSDDown", desc = "Duplicate down" },
        ["<A-K>"] = { act = "<Plug>GoVSDUp", desc = "Duplicate up" },
        ["<A-L>"] = { act = "<Plug>GoVSDRight", desc = "Duplicate right" },
    },

    -- 🅰 Actions
    ["<leader>a"] = {
        name = "Actions",

        s = { act = "<cmd>w<CR><Esc>", desc = "Save buffer" }, -- TODO notify
    },

    -- 🅱 Buffer

    -- 🅲 Command Palette
    ["<leader>c"] = { act = cmd "Legendary", desc = "Command Palette" },

    -- 🅳 Debug
    -- ["<leader>d"]

    -- 🅴 File Explorer
    ["<leader>e"] = { act = cmd "Nnn", desc = "File Explorer" },

    -- 🅵 Fuzzy Finder
    ["<leader>f"] = {
        name = "Find",

        b = {
            act = function()
                require("telescope") -- make sure telescope is started
                require("telescope.builtin").current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    })
                )
            end,
            desc = "Search in buffer",
        },
        f = { act = cmd "Telescope find_files", desc = "Files" },
        r = { act = cmd "Telescope repo list search_dirs=~/Projects/", desc = "Repos" },
        g = { act = cmd("Telescope live_grep"), desc = "Live Grep" },
        m = { act = cmd("Telescope harpoon marks"), desc = "Marks" },
        n = { act = cmd("Telescope notify"), desc = "notify" },
        t = { act = cmd("TodoTelescope"), desc = "Todos" },
    },

    -- 🅶 Git
    ["<leader>g"] = {
        name = "Git",
        ["d"] = {
            act = function()
                --todo
                print("diffview")
            end,
            desc = "Differ View",
        },
        ["<Enter>"] = { act = function() end, desc = "[Hydra] Git" },

        ["u"] = { act = cmd "Gitui", desc = "Gitui" },
    },

    -- 🅷 Help Tags
    ["<leader>h"] = { act = cmd "Telescope help_tags", desc = "Help Tags" },

    -- 🅸
    -- ["<leader>i"] = {}

    -- 🅹 Jobs
    -- ["<leader>j"] = {},

    -- 🅺 Keymaps
    ["<leader>k"] = { act = cmd "WhichKey", desc = "WhichKey" },

    -- 🅻 Lazygit
    -- ["<leader>l"] =

    -- 🅼 Marks
    ["<leader>m"] = {
        act = function()
            local hydra = require("hydras.harpoon-hydra").init_hydra()
            hydra:activate()
        end,
        desc = "[Hydra] Marks",
    },

    -- 🅽
    -- ["<leader>n"] = {}

    -- 🅾 Editor Options
    -- ["<leader>o"]

    -- 🅿 Plugins
    ["<leader>p"] = { act = cmd "Lazy", desc = "Plugins" },

    -- 🆀 QuickFix

    -- 🆁 Runner

    -- 🆂 Session

    -- 🆃 Terminal

    -- 🆄 Undotree
    ["<leader>u"] = { act = cmd "UndotreeToggle", desc = "Undotree" },

    -- 🆅

    -- 🆆 Windows
    ["<leader>w"] = {
        act = function()
            local hydra = require("hydras.windows-hydra").init_hydra()
            hydra:activate()
        end,
        desc = "[Hydra] Windows",
    },

    -- 🆇
    -- 🆈
    -- 🆉

}

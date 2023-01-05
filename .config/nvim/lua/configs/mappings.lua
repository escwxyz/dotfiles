-- Global Keymappings
-- ~~~~~~~~~~~~~~~~~~

vim.keymap.set("n", "j", "v:count == 0 ? 'gj': 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk':'k'", { expr = true, silent = true })
-- scrolling
vim.keymap.set("n", "<S-u>", "<C-u>", { silent = true, desc = "Scroll up" })
vim.keymap.set("n", "<S-d>", "<C-d>", { silent = true, desc = "Scroll down" })
-- buffer
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous buffer", silent = true })
-- Head / Last of the line
vim.keymap.set("n", "H", "_", { desc = "Head of the line", silent = true })
vim.keymap.set("n", "L", "$", { desc = "Last of the line", silent = true })

-- Save file
vim.keymap.set("n", "<leader>s", "<cmd>w<CR><Esc>", { desc = "Save current buffer", silent = true })

-- Redo
vim.keymap.set("n", "<A-r>", "<C-r>", { desc = "Redo", silent = true })
-- Legendary
vim.keymap.set("n", "<leader>l", "<cmd>Legendary<CR>", { desc = "Legendary", silent = true })
-- Lazy Plugins
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<CR>", { desc = "Plugins", silent = true })
-- NNN File Explorer
vim.keymap.set("n", "<leader>n", "<cmd>Nnn<CR>", { desc = "Nnn File Explorer", silent = true })
-- gomove
vim.keymap.set("n", "<A-h>", "<Plug>GoNSMLeft", { desc = "Move left", silent = true })
vim.keymap.set("n", "<A-j>", "<Plug>GoNSMDown", { desc = "Move down", silent = true })
vim.keymap.set("n", "<A-k>", "<Plug>GoNSMUp", { desc = "Move up", silent = true })
vim.keymap.set("n", "<A-l>", "<Plug>GoNSMRight", { desc = "Move right", silent = true })
vim.keymap.set("n", "<A-H>", "<Plug>GoNSDLeft", { desc = "Duplicate left", silent = true })
vim.keymap.set("n", "<A-J>", "<Plug>GoNSDDown", { desc = "Duplicate down", silent = true })
vim.keymap.set("n", "<A-K>", "<Plug>GoNSDUp", { desc = "Duplicate up", silent = true })
vim.keymap.set("n", "<A-L>", "<Plug>GoNSDRight", { desc = "Duplicate right", silent = true })

vim.keymap.set("x", "<A-h>", "<Plug>GoVSMLeft", { desc = "Move left", silent = true })
vim.keymap.set("x", "<A-j>", "<Plug>GoVSMDown", { desc = "Move down", silent = true })
vim.keymap.set("x", "<A-k>", "<Plug>GoVSMUp", { desc = "Move up", silent = true })
vim.keymap.set("x", "<A-l>", "<Plug>GoVSMRight", { desc = "Move right", silent = true })
vim.keymap.set("x", "<A-H>", "<Plug>GoVSDLeft", { desc = "Duplicate left", silent = true })
vim.keymap.set("x", "<A-J>", "<Plug>GoVSDDown", { desc = "Duplicate down", silent = true })
vim.keymap.set("x", "<A-K>", "<Plug>GoVSDUp", { desc = "Duplicate up", silent = true })
vim.keymap.set("x", "<A-L>", "<Plug>GoVSDRight", { desc = "Duplicate right", silent = true })

local leader_normal = {
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
        "[Hydra] Git",
    },
    t = {
        name = "Toggle",
        -- a = { "<cmd>ToggleAlternate<CR>", "alternate" },

        a = { "<cmd>AerialToggle<CR>", "Aerial" },
    },
}

local wk = require("which-key")

wk.register(leader_normal, { prefix = "<leader>" })

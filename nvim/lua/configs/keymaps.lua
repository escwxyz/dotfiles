-- Global Keymappings
-- ~~~~~~~~~~~~~~~~~~

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<Tab>", function()
--     if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
--         vim.cmd([[bnext]])
--     end
-- end, { desc = "Next buffer", expr = true })
--
-- vim.keymap.set("n", "<S-Tab>", function()
--     if #vim.api.nvim_list_tabpages() > 1 then
--         vim.cmd([[]])
--     end
-- end, { desc = "Next tabpage" })
-- TODO not working
vim.keymap.set("n", "<C-BS>", "<cmd>w<CR><Esc>", { desc = "Save buffer" })

-- Leap
vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>LeapBuffer<CR>", { desc = "[Leap] Search in buffer" })
vim.keymap.set(
    { "n", "x", "o" },
    "S",
    "<cmd>LeapWindow<CR>",
    { desc = "[Leap] Search cross window" }
)

for i = 1, 6 do
    local lhs = "<leader>" .. i
    local rhs = i .. "<C-w>w"
    vim.keymap.set("n", lhs, rhs, { desc = "Go to window #" .. i })
end

vim.keymap.set("n", "<leader><CR>", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "<leader><BS>", "O<Esc>", { desc = "New line above" })

vim.keymap.set("n", "<leader>b", "<cmd>BufferRemove<CR>", { desc = "Remove buffer" })

vim.keymap.set("n", "<leader>e", "<cmd>Xplr<CR>", { desc = "File Explorer" })

vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", "<leader>i", "<cmd>Oil<CR>", { desc = "Oil" })
vim.keymap.set("n", "<leader>j", "<cmd>OverseerRun<CR>", { desc = "Jobs" })
vim.keymap.set("n", "<leader>k", "<cmd>FzfLua keymaps<CR>", { desc = "Keymaps" })

vim.keymap.set("n", "<leader>o", "<cmd>HydraEditorOptions<CR>", { desc = "Editor options" })
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<CR>", { desc = "Plugins" })

vim.keymap.set("v", "<leader>r", "<cmd>Refactor<CR>", { desc = "Refactor" })
vim.keymap.set("n", "<leader>s", "", {})
vim.keymap.set("n", "<leader>t", "<cmd>OpenTerminal<CR>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>u", "", {})
vim.keymap.set("n", "<leader>v", "", {})

vim.keymap.set("n", "<leader>x", "", {})
vim.keymap.set("n", "<leader>y", "<cmd>Neoclip<CR>", { desc = "Yank history" })
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Zen mode" })

local ok, wk = pcall(require, "which-key")

if not ok then
    vim.notify("WhichKey is not loaded, which is required to set keymaps", vim.log.levels.ERROR)
    return
end

wk.register({
    g = {
        name = "Goto",

        ["t"] = { act = "gg", desc = "Top of the buffer" },
        ["b"] = { act = "G", desc = "Bottom of the buffer" },
        ["h"] = { act = "_", desc = "Head of the line" },
        -- ["f"] = { act = "_", desc = "First char of the line" },
        ["l"] = { act = "$", desc = "Last of the line" },

        ["k"] = { act = "H", desc = "Top of the window" },
        ["j"] = { act = "L", desc = "Bottom of the window" },
    },
}, { mode = { "n", "x" } })

wk.register({
    a = {
        name = "Annotation",

        c = { "<cmd>Neogen class<CR>", "Class" },
        f = { "<cmd>Neogen func<CR>", "Function" },
        t = { "<cmd>Neogen type<CR>", "Type" },
    },
}, { prefix = "<leader>" })

wk.register({
    c = {
        name = "Code action",

        n = { "<cmd>NodeAction<CR>", "Node action" },
    },
}, { prefix = "<leader>" })

wk.register({
    d = {
        name = "Debug",

    }
})

wk.register({
    f = {
        name = "Finder",

        b = { "<cmd>FzfLua blines<CR>", "Find in buffer" },
        f = { "<cmd>FzfLua files<CR>", "Find files" },
        p = { "<cmd>FindProjects<CR>", "Find projects" },
    },
}, { prefix = "<leader>" })

wk.register({
    w = {
        name = "Windows",

        h = { "<cmd>WinShift left<CR>", "Move to left" },
        j = { "<cmd>WinShift down<CR>", "Move down" },
        k = { "<cmd>WinShift up<CR>", "Move up" },
        l = { "<cmd>WinShift right<CR>", "Move to right" },
        H = { "<cmd>WinShift far_left<CR>", "Move far left" },
        J = { "<cmd>WinShift far_down<CR>", "Move far down" },
        K = { "<cmd>WinShift far_right<CR>", "Move far right" },
        L = { "<cmd>WinShift far_right<CR>", "Move far right" },

        r = { "<cmd>StartResizeMode<CR>", "Resize mode" },
        ["<Left>"] = { "<cmd>ResizeWindowLeft<CR>", "Resize to left" },
        ["<Right>"] = { "<cmd>ResizeWindowRight<CR>", "Resize to right" },
        ["<Up>"] = { "<cmd>ResizeWindowUp<CR>", "Resize up" },
        ["<Down>"] = { "<cmd>ResizeWindowDown<CR>", "Resize down" },

        m = { "<cmd>WindowsMaximize<CR>", "Maximize window" },
        e = { "<cmd>WindowsEqualize<CR>", "Equalize window" },

        s = { "<C-w>s", "Split horizontally" },
        v = { "<C-w>v", "Split vertically" },
    },
}, { prefix = "<leader>" })

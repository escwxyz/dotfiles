vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<top>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")

vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>tabnext<CR>", { desc = "Next tabpage" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer" })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save buffer" })
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
--
-- Leap
vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>LeapBuffer<CR>", { desc = "[Leap] Search in buffer" })
vim.keymap.set(
    { "n", "x", "o" },
    "S",
    "<cmd>LeapWindow<CR>",
    { desc = "[Leap] Search cross window" }
)

-- Dial
-- TODO not working
vim.keymap.set("n", "+", "<cmd>DialIncNormal<CR>")
vim.keymap.set("n", "-", "<cmd>DialDecNormal<CR>")
vim.keymap.set("v", "+", "<cmd>DialIncVisual<CR>")
vim.keymap.set("v", "-", "<cmd>DialDecVisual<CR>")

for i = 1, 6 do
    local lhs = "<leader>" .. i
    local rhs = i .. "<C-w>w"
    vim.keymap.set("n", lhs, rhs, { desc = "Go to window #" .. i })
end

vim.keymap.set("n", "<leader><CR>", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "<leader><BS>", "O<Esc>", { desc = "New line above" })

vim.keymap.set("n", "<leader>c", "<cmd>FindCommands<CR>", { desc = "Commands" })

vim.keymap.set("n", "<leader>g", "<cmd>GitUI<CR>", { desc = "GitUI" })
vim.keymap.set("t", "<leader>g", "<C-\\><C-n><cmd>GitUI<CR>", { desc = "Close GitUI" })

vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<CR>", { desc = "Help Tags" })

vim.keymap.set("n", "<leader>j", "<cmd>OverseerRun<CR>", { desc = "Jobs" })
vim.keymap.set("n", "<leader>k", "<cmd>FzfLua keymaps<CR>", { desc = "Keymaps" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy Plugins" })

vim.keymap.set("n", "<leader>o", "<cmd>HydraEditorOptions<CR>", { desc = "Editor options" })
vim.keymap.set("n", "<leader>p", "<cmd>FindProjects<CR>", { desc = "Projects" })

vim.keymap.set("v", "<leader>r", "<cmd>Refactor<CR>", { desc = "Refactor" })
vim.keymap.set("n", "<leader>s", "", {})
vim.keymap.set("n", "<leader>t", "<cmd>FTermToggle<CR>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<leader>t", "<C-\\><C-n><cmd>FTermToggle<CR>", { desc = "Close terminal" })
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

        t = { "gg", "Top of the buffer" },
        b = { "G", "Bottom of the buffer" },
        h = { "_", "Head of the line" },
        l = { "$", "Last of the line" },
        k = { "H", "Top of the window" },
        j = { "L", "Bottom of the window" },
    },
}, { mode = { "n", "x" } })

wk.register({
    a = {
        name = "Actions",

        g = { "<cmd>Neogen<CR>", "Annotation" },
        n = { "<cmd>NodeAction<CR>", "Node action" },
    },
}, { prefix = "<leader>" })

wk.register({
    b = {
        name = "Buffer",

        b = { "<cmd>FzfLua blines<CR>", "Blines" },
        q = { "<cmd>BufferRemove<CR>", "Quit" },
    },
}, { prefix = "<leader>" })

wk.register({
    d = {
        name = "Debug",
    },
})

wk.register({
    f = {
        name = "Files",

        f = { "<cmd>FzfLua files<CR>", "Find files" },
        o = { "<cmd>Oil --float<CR>", "Oil" },
        -- t = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
    },
}, { prefix = "<leader>" })

wk.register({
    n = {
        name = "New",

        b = { "<cmd>enew<CR>", "Buffer" },
        t = { "<cmd>tabnew<CR>", "Tabpage" },
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

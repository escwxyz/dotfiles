vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- no way to clear builtin maps, only override...

vim.keymap.set({ "n", "x" }, "gt", "gg")
vim.keymap.set({ "n", "x" }, "gb", "G")
vim.keymap.set({ "n", "x" }, "gh", "_")
vim.keymap.set({ "n", "x" }, "gl", "$")
vim.keymap.set({ "n", "x" }, "gj", "L")
vim.keymap.set({ "n", "x" }, "gk", "H")

vim.keymap.set("n", "/", "<cmd>FzfLua blines<CR>", { desc = "Search in buffer" }) -- replace the / search

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- TODO
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>tabnext<CR>", { desc = "Next tabpage" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer", silent = true })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save buffer", silent = true })
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
vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>LeapBuffer<CR>", { desc = "[Leap] Search in buffer" })
vim.keymap.set(
    { "n", "x", "o" },
    "S",
    "<cmd>LeapWindow<CR>",
    { desc = "[Leap] Search cross window" }
)

vim.keymap.set("n", "<C-t>", "<cmd>FTermToggle<CR>", { desc = "Terminal" })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>FTermToggle<CR>", { desc = "Terminal" })

vim.keymap.set("n", "<leader>q", "<cmd>BufferRemove<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>g", "<cmd>GitUI<CR>", { desc = "GitUI" })
vim.keymap.set("t", "<leader>g", "<C-\\><C-n><cmd>GitUI<CR>", { desc = "Close GitUI" })

for i = 1, 6 do
    local lhs = "<leader>" .. i
    local rhs = i .. "<C-w>w"
    vim.keymap.set("n", lhs, rhs, { desc = "Go to window #" .. i })
end

vim.keymap.set("n", "<leader><CR>", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "<leader><BS>", "O<Esc>", { desc = "New line above" })

vim.keymap.set("n", "<leader>?", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua keymaps<CR>", { desc = "Keymaps" })

vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>c", "<cmd>FindCommands<CR>", { desc = "Commands" })

vim.keymap.set("n", "<leader>h", "<cmd>FocusSplitLeft<CR>", { desc = "Split left" })
vim.keymap.set("n", "<leader>j", "<cmd>FocusSplitDown<CR>", { desc = "Split down" })
vim.keymap.set("n", "<leader>k", "<cmd>FocusSplitUp<CR>", { desc = "Split up" })
vim.keymap.set("n", "<leader>l", "<cmd>FocusSplitRight<CR>", { desc = "Split right" })

vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<CR>", { desc = "Oil" })

vim.keymap.set("n", "<leader>p", "<cmd>Lazy<CR>", { desc = "Plugins" })

vim.keymap.set("n", "<leader>q", "<cmd>BufferRemove<CR>", { desc = "Quit" })

vim.keymap.set("v", "<leader>r", "<cmd>Refactor<CR>", { desc = "Refactor" })

-- Vmux
vim.keymap.set("n", "<leader>s", "<cmd>VmuxSplit<CR>", { desc = "Vmux split horizontally" })
vim.keymap.set("n", "<leader>v", "<cmd>VmuxVsplit<CR>", { desc = "Vmux split vertically" })
-- Escape from terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>t", "<cmd>HydraEditorOptions<CR>", { desc = "Toggle options" })

vim.keymap.set("n", "<leader>u", "<cmd>UrlView<CR>", { desc = "Urls" })

vim.keymap.set("n", "<leader>y", "<cmd>Neoclip<CR>", { desc = "Yank history" })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Zen mode" })

local ok, wk = pcall(require, "which-key")

if not ok then
    vim.notify("WhichKey is not loaded, which is required to set keymaps", vim.log.levels.ERROR)
    return
end

wk.register({
    a = {
        name = "Actions",

        g = { "<cmd>Neogen<CR>", "Annotation" },
        n = { "<cmd>NodeAction<CR>", "Node action" },
    },
}, { prefix = "<leader>" })

wk.register({
    f = {
        name = "Files",

        f = { "<cmd>FzfLua files<CR>", "Find files" },
        -- o = { "<cmd>Oil --float<CR>", "Oil" },
    },
}, { prefix = "<leader>" })

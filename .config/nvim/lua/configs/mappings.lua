--- Global Keymappings
--- ~~~~~~~~~~~~~~~~~~

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })




-- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
-- ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄

vim.keymap.set("n", "<leader>ff", "<cmd>:Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>:Telescope repo list search_dirs=~/Projects/<CR>")
vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>:Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>:Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>fk", "<cmd>:Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>fa", "<cmd>:Telescope aerial<CR>")
vim.keymap.set("n", "<leader>fm", "<cmd>:Telescope harpoon marks<CR>")
vim.keymap.set("n", "<leader>fb", function()
    require("telescope") -- make sure telescope is started
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end)
vim.keymap.set("n", "<leader>fo", "<cmd>:Telescope vim_options<CR>")
vim.keymap.set("n", "<leader>fu", "<cmd>:Telescope undo<CR>")
vim.keymap.set("n", "<leader>fn", "<cmd>:Telescope notify<CR>")

--- File Explorer
--- ~~~~~~~~~~~~~
--- See https://github.com/nvim-tree/nvim-tree.lua

vim.keymap.set("n", "<leader>e", "<cmd>:NvmTreeToggle<cr>", {
    desc = "File [E]xplorer"
})

local M = {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
        require("nvim-tree").setup()
    end,
}

return M

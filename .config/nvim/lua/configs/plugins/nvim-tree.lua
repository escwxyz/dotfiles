--- File Explorer
--- ~~~~~~~~~~~~~
--- See https://github.com/nvim-tree/nvim-tree.lua

vim.keymap.set("n", "<leader>fe", "<cmd>:NvimTreeToggle<cr>", {
    desc = "[F]ile [E]xplorer"
})

local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
        require("nvim-tree").setup()
    end,
}

return M

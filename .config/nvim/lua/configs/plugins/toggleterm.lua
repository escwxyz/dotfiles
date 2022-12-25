--- Terminal
--- ~~~~~~~~
--- https://github.com/akinsho/toggleterm.nvim

local M = {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
        require("toggleterm").setup()

        local key_map = require("nvim-mapper")

        key_map.map_virtual("n", "<leader>tt", "<cmd>:ToggleTerm direction=horizontal<cr>", { silent = true }, "Term",
            "toggleterm", "[T]oggle [T]erm")
    end
}

return M

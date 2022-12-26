return {
    "mbbill/undotree",
    config = function()
        require("undotree").setup()

        local key_map = require("nvim-mapper")

        key_map.map("n", "<leader>u", "<cmd>:UndotreeToggle<cr>")
    end
}

return {
    "kevinhwang91/nvim-bqf",
    enabled = true,
    keys = {
        "<leader>q",
    },
    ft = "qf",
    config = function()
        require("plugins.bqf.config").setup()
    end
}

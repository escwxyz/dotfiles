return {
    "windwp/nvim-ts-autotag",
    ft = {
        "typescript",
        "html",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "tsx",
        "jsx",
        "markdown",
    },
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}

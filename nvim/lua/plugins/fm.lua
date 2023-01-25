return {
    "is0n/fm-nvim",
    enabled = true,
    cmd = { "Xplr", "Gitui" },
    config = function()
        require("fm").setup({
            ui = {
                default = "float",
                float = {
                    border = "rounded",
                    blend = 10,
                },
            },
        })
    end,
}

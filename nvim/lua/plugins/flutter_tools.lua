return {
    "akinsho/flutter-tools.nvim",
    enabled = true,
    ft = "dart",
    config = function()
        require("flutter-tools").setup({
            ui = {
                border = "rounded",
            },
            flutter_path = os.getenv("HOME") .. "/Development/flutter/bin/flutter",
            lsp = {
                color = {
                    enabled = true,
                },
                on_attach = require("plugins.lsp.on_attach"),
                capabilities = require("plugins.lsp.capabilities"),
            },
        })
    end,
}

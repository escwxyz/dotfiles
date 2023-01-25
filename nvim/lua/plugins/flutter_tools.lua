return {
    "akinsho/flutter-tools.nvim",
    enabled = true,
    ft = "dart",
    config = function()
        require("flutter-tools").setup({
            ui = {
                border = "rounded",
            },
            flutter_path = os.getenv("HOME") .. "/flutter/bin"
        })
    end
}

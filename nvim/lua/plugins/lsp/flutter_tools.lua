--- Flutter Tools
--- ~~~~~~~~~~~~~
--- https://github.com/akinsho/flutter-tools.nvim

local M = {}

M.setup = function()
    require("flutter-tools").setup({
        ui = {
            border = "rounded",
            -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
            -- please note that this option is eventually going to be deprecated and users will need to
            -- depend on plugins like `nvim-notify` instead.
            -- notification_style = 'native' | 'plugin'
        },
        flutter_path = os.getenv("HOME") .. "/flutter/bin"
    })
end

return M

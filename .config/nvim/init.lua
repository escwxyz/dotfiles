--TODO
--ref lazyvim
require("configs.settings")
require("configs.lazy")
require("configs.autocmds")

local colorscheme = "catppuccin"

vim.g.Theme = colorscheme

vim.cmd("colorscheme " .. colorscheme)

require("configs.settings")
require("configs.lazy")
require("configs.autocmds")

local colorscheme = "base16-everforest"

vim.g.Theme = colorscheme

vim.cmd("colorscheme " .. colorscheme)

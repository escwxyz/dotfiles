-- default theme

_G.theme = "catppuccin"

local theme = _G.theme

local cmd = "colorscheme base16-" .. theme

vim.cmd(cmd)

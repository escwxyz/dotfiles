local M = {}

local StatusLine = require("plugins.heirline.statusline")

local TabLine = require("plugins.heirline.tabline")

local utils = require("heirline.utils")

-- https://github.com/RRethy/nvim-base16/blob/master/lua/base16-colorscheme.lua
local function setup_colors()
    local colors
    if string.sub(vim.g.Theme, 1, 6) == "base16" then
        colors = {
            background = utils.get_highlight("StatusLine").bg,
            foreground = utils.get_highlight("StatusLine").fg,
            background_nc = utils.get_highlight("StatusLineNC").bg,
            forground_nc = utils.get_highlight("StatusLineNC").fg,

            text_dim = utils.get_highlight("Comment").fg,
            text_highlight = utils.get_highlight("Constant").fg,

            highlight = utils.get_highlight("String").fg,

            git_add_fg = utils.get_highlight("DiffAdd").fg,
            git_change_fg = utils.get_highlight("DiffChange").fg,
            git_delete_fg = utils.get_highlight("DiffDelete").fg,

            diag_warn_fg = utils.get_highlight("DiagnosticWarn").fg,
            diag_error_fg = utils.get_highlight("DiagnosticError").fg,
            diag_hint_fg = utils.get_highlight("DiagnosticHint").fg,
            diag_info_fg = utils.get_highlight("DiagnosticInfo").fg,

            tabline_fg = utils.get_highlight("TabLine").fg,
            tabline_sl_fg = utils.get_highlight("TabLineSel").fg,
            tabline_bg = utils.get_highlight("TabLine").bg,
        }
    end

    return colors
end

M.setup = function()
    -- NOTE must be loaded before setup
    require("heirline").load_colors(setup_colors()) -- load the colors from the current theme

    require("heirline").setup({
        statusline = StatusLine,
        tabline = TabLine,
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            utils.on_colorscheme(setup_colors()) -- once the theme has been changed, update the colors
        end,
        group = vim.api.nvim_create_augroup("Heirline", { clear = true }),
    })
end

return M
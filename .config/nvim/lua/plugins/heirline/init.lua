local M = {}

local conditions = require("heirline.conditions")

local Align = { provider = "%=" }

local ViMode = require("plugins.heirline.components.vi_mode")

local GitStatus = require("plugins.heirline.components.git")

local Time = require("plugins.heirline.components.time")

local Navic = require("plugins.heirline.components.navic")

local Lazy = require("plugins.heirline.components.lazy")

local BufferLine = require("plugins.heirline.components.bufferline")
-- local Diagnostics = require("plugins.heirline.components.diagnostics")
local TabLineOffset = require("plugins.heirline.components.tablineoffset")

local TabList = require("plugins.heirline.components.tablist")

local Hydra = require("plugins.heirline.components.hydra")

local Space = { provider = " " }

local default_statusline = {
    ViMode,
    GitStatus,
    Space,
    Space,
    Navic,
    Align,
    --    Diagnostics,
    Lazy,
    Space,
    Time,
}

local hydra_statusline = {
    condition = function()
        return require("hydra.statusline").get_hint() ~= nil
    end,
    Align,
    Hydra,
    Align,
}

local TabLine = {
    TabLineOffset,
    Space,
    BufferLine,
    Align,
    TabList,
    Space,
}

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

            git_add_fg = utils.get_highlight("DiffAdd").fg,
            git_change_fg = utils.get_highlight("DiffChange").fg,
            git_delete_fg = utils.get_highlight("DiffDelete").fg,

            diag_warn_fg = utils.get_highlight("DiagnosticWarn").fg,
            diag_error_fg = utils.get_highlight("DiagnosticError").fg,
            diag_hint_fg = utils.get_highlight("DiagnosticHint").fg,
            diag_info_fg = utils.get_highlight("DiagnosticInfo").fg,
        }
    end

    return colors
end

M.setup = function()
    -- NOTE must be loaded before setup
    require("heirline").load_colors(setup_colors()) -- load the colors from the current theme

    require("heirline").setup({
        statusline = {
            fallthrough = false,
            hydra_statusline,
            default_statusline,
        },
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

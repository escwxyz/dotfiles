local M = {}

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
    Hydra,
    Align,
    --    Diagnostics,
    Lazy,
    Space,
    Time,
}

local StatusLines = { default_statusline }

-- local Winbar = {
--     provider = function(_)
--         return "Hello"
--     end,
-- }

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
    return {
        bright_bg = utils.get_highlight("Folded").bg,
        bright_fg = utils.get_highlight("Folded").fg,
        red = utils.get_highlight("DiagnosticError").fg,
        dark_red = utils.get_highlight("DiffDelete").bg,
        green = utils.get_highlight("String").fg,
        blue = utils.get_highlight("Function").fg,
        gray = utils.get_highlight("NonText").fg,
        orange = utils.get_highlight("Constant").fg,
        purple = utils.get_highlight("Statement").fg,
        cyan = utils.get_highlight("Special").fg,
        diag_warn = utils.get_highlight("DiagnosticWarn").fg,
        diag_error = utils.get_highlight("DiagnosticError").fg,
        diag_hint = utils.get_highlight("DiagnosticHint").fg,
        diag_info = utils.get_highlight("DiagnosticInfo").fg,
        git_del = utils.get_highlight("diffDelete").fg,
        git_add = utils.get_highlight("diffAdded").fg,
        git_change = utils.get_highlight("diffChange").fg,
    }
end

M.on_colorscheme = function()
    local colors = setup_colors()
    utils.on_colorscheme(colors)
end

M.setup = function()
    require("heirline").setup(StatusLines, nil, TabLine)

    require("heirline").load_colors(setup_colors())
end

return M

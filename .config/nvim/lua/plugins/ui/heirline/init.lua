local M = {}

local utils = require("heirline.utils")

local colors = require("catppuccin.palettes").get_palette("mocha")

local Align = { provider = "%=" }

local ViMode = require("plugins.ui.heirline.components.vi_mode")

local GitStatus = require("plugins.ui.heirline.components.git")

local Time = require("plugins.ui.heirline.components.time")

local File = require("plugins.ui.heirline.components.file")

local Navic = require("plugins.ui.heirline.components.navic")

local Diagnostics = require("plugins.ui.heirline.components.diagnostics")

local Buffers = require("plugins.ui.heirline.components.buffers")

local Space = { provider = " " } -- no colored

local default_statusline = {
    ViMode,
    GitStatus,
    -- TODO   Buffers,
    Space,
    Navic,
    Align,
    Diagnostics,
    Space,
    Time,
}

local hydra_statusline = {}

local StatusLines = { default_statusline }

M.setup_colors = function()
    require("heirline").load_colors(colors)

    vim.api.nvim_create_augroup("Heirline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            utils.on_colorscheme(colors)
        end,
        group = "Heirline",
    })
end

M.setup = function()
    require("heirline").setup(StatusLines)
end

return M

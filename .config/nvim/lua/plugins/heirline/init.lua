local M = {}

local utils = require("heirline.utils")

local colors = require("catppuccin.palettes").get_palette("mocha")

local Align = { provider = "%=" }

local ViMode = require("plugins.heirline.components.vi_mode")

local GitStatus = require("plugins.heirline.components.git")

local Time = require("plugins.heirline.components.time")

local File = require("plugins.heirline.components.file")

local Navic = require("plugins.heirline.components.navic")

-- local Diagnostics = require("plugins.heirline.components.diagnostics")

local Buffers = require("plugins.heirline.components.buffers")

local Hydra = require("plugins.heirline.components.hydra")

local Space = { provider = " ", hl = { fg = colors.mantle, bg = colors.mantle } }

local default_statusline = {
    ViMode,
    GitStatus,
    Space,
    -- Buffers,
    Space,
    Navic,
    Align,
    Hydra,
    Align,
    --    Diagnostics,
    Space,
    Time,
}

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

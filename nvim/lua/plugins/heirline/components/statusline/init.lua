local Time = require("plugins.heirline.components.statusline.time")
local ViMode = require("plugins.heirline.components.statusline.vi_mode")
local GitStatus = require("plugins.heirline.components.statusline.git")
local Lazy = require("plugins.heirline.components.statusline.lazy")
-- local WorkSpace = require("plugins.heirline.components.shared.workspace")
local Align = require("plugins.heirline.components.shared.align")
-- local Space = require("plugins.heirline.components.shared.space")
local Hydra = require("plugins.heirline.components.statusline.hydra")

return {
    condition = function()
        local zenmode = vim.g.ZenMode
        if zenmode then
            return false
        end
        return true
    end,
    fallthrough = false,
    {
        condition = function()
            return require("hydra.statusline").get_hint() ~= nil
        end,
        Align,
        Hydra,
        Align,
    },

    {
        ViMode,
        -- Space,
        -- WorkSpace,
        GitStatus,
        Align,
        Lazy,
        Time,
    },
}

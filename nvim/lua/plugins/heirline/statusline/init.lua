local Time = require("plugins.heirline.statusline.time")
local ViMode = require("plugins.heirline.statusline.vi_mode")
local GitStatus = require("plugins.heirline.statusline.git")
local Lazy = require("plugins.heirline.statusline.lazy")
local WorkSpace = require("plugins.heirline.shared.workspace")
local Align = require("plugins.heirline.shared.align")
local Space = require("plugins.heirline.shared.space")
local Hydra = require("plugins.heirline.statusline.hydra")

return {
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
        Space,
        WorkSpace,
        GitStatus,
        Align,
        Lazy,
        Time,
    },
}
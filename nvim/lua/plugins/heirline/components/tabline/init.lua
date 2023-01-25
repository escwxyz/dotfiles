local TablineOffset = require("plugins.heirline.components.tabline.tablineoffset")
local BufferLine = require("plugins.heirline.components.tabline.bufferline").BufferLine
local Tablist = require("plugins.heirline.components.tabline.tablist")

local Align = require("plugins.heirline.components.shared.align")

return {
    Tablist,
    Align,
    BufferLine,
    TablineOffset,
}

--- Manage all icons for plugins

local M = {}

-- TODO put all icons here
local outline_icons = {
    cmd = " ",
    error = "",
    file = " ",
    event = "",
    operator = " ",
}

local solid_icons = {
    file = " ",
}

M.notification_icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = " ",
    WARN = "",
}

M.todo_icons = {
    FIX = "",
    TODO = "⏱",
    HACK = "",
    WARN = " ",
}

M.navic_icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "練",
    Interface = "練",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "◩ ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
}

-- File = ' ',
--     Module = ' ',
--     Namespace = ' ',
--     Package = ' ',
--     Class = ' ',
--     Method = ' ',
--     Property = ' ',
--     Field = ' ',
--     Constructor = ' ',
--     Enum = ' ',
--     Interface = ' ',
--     Function = ' ',
--     Variable = ' ',
--     Constant = ' ',
--     String = ' ',
--     Number = ' ',
--     Boolean = ' ',
--     Array = ' ',
--     Object = ' ',
--     Key = ' ',
--     Null = ' ',
--     EnumMember = ' ',
--     Struct = ' ',
--     Event = ' ',
--     Operator = ' ',
--     TypeParameter = ' '

M.kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

M.diagnostic_icons = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}

return M

--- Manage all icons for plugins

local M = {}

M.notification_icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = " ",
    WARN = ""
}

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
    TypeParameter = ""
}

M.diagnostic_icons = {
    Error = " ", Warn = " ", Hint = " ", Info = " ",
}

return M

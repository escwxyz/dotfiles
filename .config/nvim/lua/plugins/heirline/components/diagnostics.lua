local conditions = require("heirline.conditions")

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    hl = { bg = "background" },

    {
        provider = function(self)
            return self.errors > 0 and (" " .. self.error_icon .. self.errors)
        end,
        hl = { fg = "diag_error_fg" },
    },
    {
        provider = " ",
        condition = function(self)
            return self.info > 0 or self.warnings > 0 or self.hints > 0
        end,
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings)
        end,
        hl = { fg = "diag_warn_fg" },
    },
    {
        provider = " ",
        condition = function(self)
            return self.info > 0 or self.hints > 0
        end,
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info)
        end,
        hl = { fg = "diag_info_fg" },
    },
    {
        provider = " ",
        condition = function(self)
            return self.hints > 0
        end,
    },

    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "diag_hint_fg" },
    },
}

return Diagnostics

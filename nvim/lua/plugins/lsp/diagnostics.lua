local M = {}
local signs = require("configs.icons").diagnostic_icons
M.define_diagnostics = function()
    vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

return M

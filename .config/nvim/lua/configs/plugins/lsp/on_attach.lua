local M = {}

local key_map = function(key, rhs, bufnr)
    vim.keymap.set("n", key, rhs, { silent = true, buffer = bufnr })
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }



M.on_attach = function(client, bufnr)

    vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    key_map("gd", require("telescope.builtin").lsp_definitions, bufnr)
    key_map("gr", require("telescope.builtin").lsp_references, bufnr)
    key_map("gt", require("telescope.builtin").lsp_type_definitions)
    key_map("K", vim.lsp.buf.hover)
end

return M

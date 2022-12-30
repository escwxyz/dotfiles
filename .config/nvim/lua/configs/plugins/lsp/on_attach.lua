local M = {}


-- TODO

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

    vim.keymap.set("n", "gd", require("goto-preview").goto_preview_definition, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "gt", require("goto-preview").goto_preview_type_definition, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "gr", require("goto-preview").goto_preview_references, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "gi", require("goto-preview").goto_preview_implementation, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "gq", require("goto-preview").close_all_win, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, buffer = bufnr })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, buffer = bufnr })

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    vim.keymap.set({ "n", "v" }, "ff", "<cmd>:Format<CR>", { silent = true, buffer = bufnr })

    if client.server_capabilities.renameProvider ~= nil then
        -- TODO return ":IncRename " .. vim.fn.expand("<cword>")
    else
        vim.keymap.set("n", "rr", vim.lsp.buf.rename, { silent = true, buffer = bufnr })
    end


end

return M

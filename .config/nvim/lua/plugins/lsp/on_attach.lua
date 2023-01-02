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
    -- TODO goto-preview would require telescope automatically
    vim.keymap.set(
        "n",
        "gd",
        require("goto-preview").goto_preview_definition,
        { silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "gt",
        require("goto-preview").goto_preview_type_definition,
        { silent = true, buffer = bufnr }
    )
    -- This requires telescope to be loaded
    -- vim.keymap.set("n", "gr", require("goto-preview").goto_preview_references, { silent = true, buffer = bufnr })
    vim.keymap.set(
        "n",
        "gi",
        require("goto-preview").goto_preview_implementation,
        { silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "gq",
        require("goto-preview").close_all_win,
        { silent = true, buffer = bufnr }
    )
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, buffer = bufnr })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, buffer = bufnr })

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    vim.keymap.set({ "n", "v" }, "ff", "<cmd>Format<CR>", { silent = true, buffer = bufnr })

    -- vim.keymap.set("n", "rr", function(
    --     if client.server_capabilities.renameProvider ~= nil then
    --         return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
    --     else
    --         vim.lsp.buf.rename()
    --     end
    -- end, { silent = true, buffer = bufnr })

end

return M

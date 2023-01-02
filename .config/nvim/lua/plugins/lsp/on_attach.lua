local M = {}

-- TODO

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

local wk = require("which-key")

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

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    wk.register({
        g = {
            name = "goto",

            d = { require("goto-preview").goto_preview_definition, "definition" },
            t = { require("goto-preview").goto_preview_type_definition, "type definition" },
            i = { require("goto-preview").goto_preview_implementation, "implementation" },
            q = { require("goto-preview").close_all_win, "close all goto windows" }
        },
        K = { vim.lsp.buf.hover, "hover" },
        ["[d"] = { vim.diagnostic.goto_prev, "previous diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, "next diagnostic" },
        ["ff"] = { "<cmd>Format<CR>", "format current buffer" }
    }, { buffer = bufnr })

    -- This requires telescope to be loaded
    -- vim.keymap.set("n", "gr", require("goto-preview").goto_preview_references, { silent = true, buffer = bufnr })

    -- vim.keymap.set("n", "rr", function(
    --     if client.server_capabilities.renameProvider ~= nil then
    --         return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
    --     else
    --         vim.lsp.buf.rename()
    --     end
    -- end, { silent = true, buffer = bufnr })

end

return M

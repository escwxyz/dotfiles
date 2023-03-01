local on_attach = function(client, bufnr)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, { desc = "[LSP] Hover", buffer = bufnr })

    vim.keymap.set("n", "<leader>aa", function()
        vim.lsp.buf.code_action()
    end, { desc = "[LSP] Code action", buffer = bufnr })

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "[LSP] Diagnostics" }) -- TODO change keymap

    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next({})
    end, { desc = "Next diagnostic", buffer = bufnr })

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev({})
    end, { desc = "Prev diagnostic", buffer = bufnr })

    require("which-key").register({
        ["gp"] = {
            d = { "<cmd>GotoPreviewDefinition<CR>", "[LSP] Goto definition" },
            t = { "<cmd>GotoPreviewTypeDefinition<CR>", "[LSP] Goto type definition" },
            i = { "<cmd>GotoPreviewImplementation<CR>", "[LSP] Goto implementation" },
            q = { "<cmd>GotoPreviewCloseWin<CR>", "[LSP] Goto close win" },
        },
    }, { buffer = bufnr })

    --     -- if client.server_capabilities.documentSymbolProvider then
    --     --     navic.attach(client, bufnr)
    --     -- end

    --     vim.keymap.set("n", "rr", function()
    --         if client.server_capabilities.renameProvider ~= nil then
    --             return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
    --         else
    --             vim.lsp.buf.rename()
    --         end
    --     end, { silent = true, buffer = bufnr })
end

return on_attach

return {
  setup = function(client, buffer)
    local cap = client.server_capabilities
    local bufopts = { buffer = buffer, silent = true }


    -- Common Keymappings

    -- lsp_map("gd", require("telescope.builtin").lsp_definitions, "telescope_lsp_definitions", "[G]oto [D]efinition")
    -- lsp_map("gr", require("telescope.builtin").lsp_references, "telescope_lsp_references", "[G]oto [R]eference")
    -- lsp_map("gi", require("telescope.builtin").lsp_implementations, "telescope_lsp_implementations",
    --   "[G]oto [I]mplementations")
    -- lsp_map("gt", require("telescope.builtin").lsp_type_definitions, "telescope_lsp_type_definitions",
    --   "[G]oto [T]ype Definitions")

    -- lsp_map("K", vim.lsp.buf.hover, "hover_documentation", "Hover Documentation")
    -- lsp_map("<c-k>", vim.lsp.buf.signature_help, "signature_documentation", "Signature Documentation")

    -- TODO trouble
    -- Diagnostics
    -- lsp_map("[d", vim.diagnostic.goto_prev, "prev_diagnostic", "Previous [D]iagnostic")
    -- lsp_map("]d", vim.diagnostic.goto_next, "next_diagnostic", "Next [D]iagnostic")
    -- lsp_map("<leader>d", vim.diagnostic.open_float, "show_diagnostic", "Show [D]iagnostic")
    -- lsp_map("<leader>fd", function()
    --   require("telescope.builtin").diagnostics({ bufnr = 0 })
    -- end, "telescope_find_diagnostics", "[F]ind [D]iagnostics")

    -- TODO test
    -- key_map.map("n", "<leader>rr", function()
    --   if cap.renameProvider ~= nil then
    --     require("inc_rename")
    --     return ":IncRename " .. vim.fn.expand("<cword>")
    --   else
    --     vim.lsp.buf.rename()
    --   end
    -- end, bufopts, "LSP", "rename", "[R]e[n]ame")

    if cap.documentFormatting ~= nil then
      -- key_map.map("n", "<leader><leader>f", require("config.plugins.lsp.formatting").format, bufopts, "LSP", "format",
      --   "Format")
    end

    if cap.documentRangeFormatting ~= nil then
      -- key_map.map("v", "<leader><leader>f", require("config.plugins.lsp.formatting").format, bufopts, "LSP", "format",
      --   "Format")
    end

    -- Typescript
    -- if client.name == "tsserver" then
    --   key_map.map("n", "<leader>ti", "<cmd>:TypescriptOrganizeImports<cr>", bufopts, "LSP", "ts_orgnaize_imports",
    --     "Typescript Organize Imports")
    --   key_map.map("n", "<leader>tr", "<cmd>:TypescriptRenameFile<cr>", bufopts, "LSP", "ts_rename_file",
    --     "Typescript Rename File")
    -- end

    -- Rust
    if client.name == "rust_analyzer" then
      local rt = require("rust-tools")

      -- lsp_map("<C-space>", rt.hover_actions.hover_actions, "rust_hover_actions", "Rust Hover Actions")
      -- lsp_map("<leader>a", rt.code_action_group.code_action_group, "rust_action_group", "Rust Code Action Group")
    end

  end
}

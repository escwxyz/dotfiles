-- TODO

local M = {}

function M.setup(client, buffer)
  local cap = client.server_capabilities

  local key_map = require("nvim-mapper")

  key_map.map("n", "gd", "<cmd>:Telescope lsp_definitions<cr>", {}, "LSP", "lsp_definitions", "[G]oto [D]efinition")
  key_map.map("n", "gr", "<cmd>:Telescope lsp_references<cr>", {}, "LSP", "lsp_refernces", "[G]oto [R]eference")
  key_map.map("n", "gtr", "<cmd>:Trouble lsp_references<cr>", {}, "LSP", "trouble_lsp_refernces",
    "[G]oto [T]rouble [R]eference")
  key_map.map("n", "gdl", "<cmd>:Telescope lsp_declarations<cr>", {}, "LSP", "lsp_declarations",
    "[G]oto [D]ec[l]arations")
  key_map.map("n", "gi", "<cmd>:Telescope lsp_implementations<cr>", {}, "LSP", "lsp_implemations",
    "[G]oto [I]mplemations")
  key_map.map("n", "gt", "<cmd>:Telescope lsp_type_definitions<cr>", {}, "LSP", "lsp_type_definitions",
    "[G]oto [T]ype Definitions")

  key_map.map("n", "e[", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>",
    {}, "LSP", "prev_error", "Previous Error"
  )
  key_map.map("n", "e]", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>",
    {}, "LSP", "next_error", "Next Error"
  )
  key_map.map("n", "w[", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<cr>",
    {}, "LSP", "prev_warning", "Previous Warning"
  )
  key_map.map("n", "w]", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<cr>",
    {}, "LSP", "next_warning", "Next Warning"
  )

  key_map.map("n", "<S-h>", "<cmd>:lua vim.lsp.buf.hover()<cr>", {}, "LSP", "hover", "Hover")

  if cap.renameProvider ~= nil then
    key_map.map("n", "<leader>rr", function()
      require("inc_rename")
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, {}, "LSP", "inc_rename", "Rename")
  end

  if client.name == "tsserver" then
    key_map.map("n", "<leader>ti", "<cmd>:TypescriptOrganizeImports<cr>", {}, "LSP", "ts_orgnaize_imports",
      "Typescript Organize Imports")
    key_map.map("n", "<leader>tr", "<cmd>:TypescriptRenameFile<cr>", {}, "LSP", "ts_rename_file",
      "Typescript Rename File")
  end

  key_map.map("n", "<leader>fd",
    "<cmd>:Telescope diagnostics<cr>", {}, "lSP", "telescope_find_diagnostics", "[F]ind [D]iagnostics")

  key_map.map("n", "<leader>d", vim.diagnostic.open_float, {}, "LSP", "show_diagnostic", "Show [D]iagnostic")
  key_map.map("n", "[d", vim.diagnostic.goto_prev, {}, "LSP", "prev_diagnostic", "Previous [D]iagnostic")
  key_map.map("n", "]d", vim.diagnostic.goto_next, {}, "LSP", "next_diagnostic", "Next [D]iagnostic")
  key_map.map("n", "<leader>q", vim.diagnostic.setloclist, {}, "LSP", "what_diagnostic", "Show [D]iagnostic")

  local bufopts = { noremap = true, silent = true, buffer = buffer }
  key_map.map("n", "<leader>rn", vim.lsp.buf.rename, bufopts, "LSP", "rename_diagnostic", "[R]e[n]ame")



  -- local keymap = {
  --   buffer = buffer,
  --   ["<leader>"] = {
  --     c = {
  --       name = "+code",
  --       a = {
  --         { vim.lsp.buf.code_action, "Code Action" },
  --         { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
  --       },
  --       f = {
  --         {
  --           require("config.plugins.lsp.formatting").format,
  --           "Format Document",
  --           cond = cap.documentFormatting,
  --         },
  --         {
  --           require("config.plugins.lsp.formatting").format,
  --           "Format Range",
  --           cond = cap.documentRangeFormatting,
  --           mode = "v",
  --         },
  --       },
  --       d = { vim.diagnostic.open_float, "Line Diagnostics" },
  --       l = {
  --         name = "+lsp",
  --         i = { "<cmd>LspInfo<cr>", "Lsp Info" },
  --         a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
  --         r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
  --         l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
  --       },
  --     },
  --   },
  -- }

end

return M

local M = {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPost",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
    "folke/trouble.nvim",
  },
  config = function()
    require("neodev").setup()
    require("configs.plugins.lsp.diagnostics").setup()

    local function on_attach(client, bufnr)
      require("configs.plugins.lsp.formatting").setup(client, bufnr)
      require("configs.plugins.lsp.keys").setup(client, bufnr)
    end

    local servers = {
      jsonls = {
        json = {
          format = {
            enable = true,
          },
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },

        },
      },
      rust_analyzer = {
        -- https://github.com/simrat39/rust-tools.nvim
        -- executor = require("rust-tools.executors").termopen,
        -- reload_workspace_from_cargo_toml = true,
      },
      tsserver = {},
      sumneko_lua = {
        Lua = {
          telemetry = { enable = false },
          format = { enable = false },
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- https://github.com/hrsh7th/nvim-cmp#setup
    -- combination with cmp
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    require("mason").setup()
    -- TODO lazy load on file format??
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers)
    })

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          flags = {
            debounce_text_changes = 150,
          }
        })
      end,

      ["rust_analyzer"] = function()
        require("rust-tools").setup({
          server = {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = {
              debounce_text_changes = 150
            },
          },
          tools = servers["rust_analyzer"]
        })
      end,

      ["tsserver"] = function()
        require("typescript").setup({
          server = {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = {
              debounce_text_changes = 150
            },
          },
        })
      end
    })

    require("configs.plugins.null-ls").on_attach(on_attach)

  end
}

return M

return {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPost",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
    "folke/trouble.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim"
  },
  config = function()
    require("mason")
    require("neodev").setup()

    -- LSP Servers
    local servers = {
      tsserver = {},
      rust_analyzer = {},
      sumneko_lua = {
        Lua = {
          telemetry = { enable = false },
          format = { enable = false },
          completion = {
            callSnippet = "Replace"
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false
          }
        }
      }
    }

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers)
    })

    require("fidget").setup()

    local on_attach = require("configs.plugins.lsp.on_attach").on_attach

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = require("configs.plugins.lsp.cap").cap,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end
}

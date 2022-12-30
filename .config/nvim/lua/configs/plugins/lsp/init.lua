return {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
    "folke/trouble.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "rmagatti/goto-preview",
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

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = require("configs.plugins.lsp.cap").cap,
          on_attach = require("configs.plugins.lsp.on_attach").on_attach,
          settings = servers[server_name],
        }
      end,
    }

    require("goto-preview").setup({
      width = 120; -- Width of the floating window
      height = 15; -- Height of the floating window
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }; -- Border characters of the floating window
      default_mappings = false; -- Bind default mappings
      debug = false; -- Print debug information
      opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
      resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
      post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
      references = { -- Configure the telescope UI for slowing the references cycling window.
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
      };
      -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true; -- Focus the floating window when opening it.
      dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
      force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
    })
  end
}

local M = {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
    "b0o/SchemaStore.nvim",
    "folke/trouble.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "simrat39/rust-tools.nvim",
  },
  config = function()
    require("mason")
    -- require("configs.plugins.lsp.diagnostics").setup()
    -- require("neoconf").setup()

    local function on_attach(client, bufnr)
      -- require("nvim-navic").attach(client, bufnr)
      require("configs.plugins.lsp.formatting").setup(client, bufnr)
      require("configs.plugins.lsp.keys").setup(client, bufnr)

    end

    -- Remove unneeded servers
    -- See https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    local servers = {
      cssls = {},
      tsserver = {},
      eslint = {},
      html = {},
      jsonls = {
        settings = {
          json = {
            format = {
              enable = true,
            },
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      marksman = {},
      -- See https://github.com/folke/dot/issues/7#issuecomment-1362280248
      -- Also https://github.com/simrat39/rust-tools.nvim#configuration
      rust_analyzer = {
        tools = {
          autoSetHints = true,
          hover_with_actions = false,
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                disabled = { "incorrect-ident-case" }
              },
              completion = {
                postfix = {
                  enable = false
                }
              },
              checkOnSave = {
                command = "clippy"
              },
              procMacro = {
                enable = true
              },
            }
          }
        }
      },
      sumneko_lua = {
        single_file_support = true,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              workspaceWord = true,
              callSnippet = "Both",
            },
            misc = {
              parameters = {
                "--log-level=trace",
              },
            },
            diagnostics = {
              -- enable = false,
              groupSeverity = {
                strong = "Warning",
                strict = "Warning",
              },
              groupFileStatus = {
                ["ambiguity"] = "Opened",
                ["await"] = "Opened",
                ["codestyle"] = "None",
                ["duplicate"] = "Opened",
                ["global"] = "Opened",
                ["luadoc"] = "Opened",
                ["redefined"] = "Opened",
                ["strict"] = "Opened",
                ["strong"] = "Opened",
                ["type-check"] = "Opened",
                ["unbalanced"] = "Opened",
                ["unused"] = "Opened",
              },
              unusedLocalExclude = { "_*" },
            },
            format = {
              enable = false,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                continuation_indent_size = "2",
              },
            },
          },
        },
      },
      tailwindcss = {},
      yamlls = {},
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- https://github.com/hrsh7th/nvim-cmp#setup
    -- combination with cmp
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local options = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }

    -- TODO flutter-tools

    for server, opts in pairs(servers) do
      if server == "tsserver" then
        -- https://github.com/jose-elias-alvarez/typescript.nvim
        -- Use typescript instead of tsserver as LSP server
        require("typescript").setup({
          server = vim.tbl_deep_extend("force", {}, options, opts or {}),
          disable_commands = true, -- stop creating vim commands
        })
      elseif server == "rust_analyzer" then
        -- TODO
        opts.server = vim.tbl_deep_extend("force", {}, options, opts.server or {})
        require("rust-tools").setup(opts)
      else
        opts = vim.tbl_deep_extend("force", {}, options, opts or {})
        require("lspconfig")[server].setup(opts) -- setup for each other LSP server
      end
    end

    require("configs.plugins.null-ls").on_attach(options.on_attach)

  end
}

return M

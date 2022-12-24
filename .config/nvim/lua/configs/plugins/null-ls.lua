--- Linter & Formatter & Completion
--- ~~~~~~~~~~~~~~~~~~
--- https://github.com/jose-elias-alvarez/null-ls.nvim

local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPost",
    config = function()
        local nls = require("null-ls")

        local builtins = nls.builtins

        nls.setup({
            debounce = 150,
            save_after_format = false,
            sources = {
                -- TODO add extra flags
                builtins.formatting.isort,
                builtins.formatting.prettierd.with({
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html",
                    },
                    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
                }),
                builtins.formatting.stylua,
                builtins.formatting.fish_indent,
                -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
                -- nls.builtins.formatting.eslint_d,
                builtins.formatting.shfmt,

                builtins.diagnostics.markdownlint,
                builtins.diagnostics.eslint,
                -- nls.builtins.diagnostics.luacheck,
                -- nls.builtins.code_actions.gitsigns,
                builtins.completion.spell

            },
            -- root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
        })

        --TODO keymaps
        local key_map = require("nvim-mapper")
    end
}

function M.on_attach(opts)
    require("null-ls").setup({
        on_attach = opts
    })
end

function M.has_formatter(ft)
    local sources = require("null-ls.sources")
    local available = sources.get_available(ft, "NULL_LS_FORMATTING")
    return #available > 0
end

return M

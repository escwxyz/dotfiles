--- Completion Engine
--- ~~~~~~~~~~~
--- https://github.com/hrsh7th/nvim-cmp

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source from the current buffer?
        "hrsh7th/cmp-path", -- source from paths of files & folders
        "hrsh7th/cmp-cmdline", -- source from command line?
        "hrsh7th/cmp-nvim-lsp", -- source from lsp
        "saadparwaiz1/cmp_luasnip" -- source form luasnip snippets
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expande = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },

            mapping = cmp.mapping.preset.insert({
                -- TODO
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = "luasnip" }, -- https://github.com/saadparwaiz1/cmp_luasnip
                { name = "buffer" },
                -- TODO add more sources here
            }),

            window = {},

            formatting = {
                -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
                -- Different icons representing different kinds of completations in the dropdown menu
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                    -- Source
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        -- latex_symbols = "[LaTeX]",
                    })[entry.source.name]

                    return vim_item
                end
            }
        })
    end
}

return M

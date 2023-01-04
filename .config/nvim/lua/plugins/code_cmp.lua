--- Completion Engine
--- ~~~~~~~~~~~
--- https://github.com/hrsh7th/nvim-cmp

-- TODO appearance

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip"
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        cmp.setup({
            enabled = function()
                -- disable in prompt
                local buftype = vim.api.nvim_buf_get_option(0, "buftype")
                if buftype == "prompt" then return false end
                return true
            end,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            -- TODO the mappings need to be redone
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                -- TODO This is the cause for enter key: when there is no cmp menu, enter won't work for new line insertion
                -- ['<CR>'] = cmp.mapping({
                --     i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                --     c = function(fallback)
                --         if cmp.visible() then
                --             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                --         else
                --             fallback()
                --         end
                --     end
                -- }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' })
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = "luasnip" },
                { name = "buffer", },
            }),

            window = {
                completion = cmp.config.window.bordered(),
            },
            formatting = {
                fields = {
                    "kind", "abbr",
                },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format('%s', require("configs.icons").kind_icons[vim_item.kind])

                    return vim_item
                end
            }
        })

    end
}
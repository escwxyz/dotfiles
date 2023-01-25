local M = {}

local cmp = require("cmp")

local luasnip_installed, luasnip = pcall(require, "luasnip")

local neogen_installed, neogen = pcall(require, "neogen")

M.setup = function()
    cmp.setup({
        enabled = function()
            -- disable in prompt
            local buftype = vim.api.nvim_buf_get_option(0, "buftype")
            if buftype == "prompt" then
                return false
            end
            -- disable in comment
            local context = require("cmp.config.context")
            if vim.api.nvim_get_mode().mode == "c" then
                return true
            else
                return not context.in_treesitter_capture("comment")
                    and not context.in_syntax_group("Comment")
            end
        end,
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete({}),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip_installed and luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif neogen_installed and neogen.jumpable() then
                    neogen.jump_next()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                elseif neogen.jumpable(-1) then
                    neogen.jump_prev()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
            {
                name = "nvim_lsp",
                entry_filter = function(entry, _)
                    local kind = entry:get_kind()
                    local node = require("nvim-treesitter.ts_utils").get_node_at_cursor():type()
                    if node == "arguments" then
                        if kind == 6 then
                            return true
                        else
                            return false
                        end
                    end

                    return true
                end,
            },
            { name = "luasnip" },
            { name = "buffer" },
        }),

        window = {
            completion = cmp.config.window.bordered(), --TODO
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            fields = {
                "kind",
                "abbr",
                "menu",
            },
            format = function(entry, vim_item)
                vim_item.kind =
                string.format("%s", require("configs.icons").kind_icons[vim_item.kind])

                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                })[entry.source.name]

                vim_item.abbr = vim_item.abbr:match("[^(]+") -- remove parameters from function abbr

                return vim_item
            end,
        },
    })
end

return M

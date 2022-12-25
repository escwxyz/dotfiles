--- Snippet Engine
--- ~~~~~~~~
--- https://github.com/L3MON4D3/LuaSnip#documentation

local M = {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")

        ls.config.set_config({
            history = false,
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            -- Event on which to check for exiting a snippet's region
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave',
        })

        -- local s = ls.snippet
        -- local sn = ls.snippet_node
        -- local isn = ls.indent_snippet_node
        -- local t = ls.text_node
        -- local i = ls.insert_node
        -- local f = ls.function_node
        -- local c = ls.choice_node
        -- local d = ls.dynamic_node
        -- local r = ls.restore_node
        -- local events = require("luasnip.util.events")
        -- local ai = require("luasnip.nodes.absolute_indexer")
        -- local fmt = require("luasnip.extras.fmt").fmt
        -- local m = require("luasnip.extras").m
        -- local lambda = require("luasnip.extras").l
        -- local postfix = require("luasnip.extras.postfix").postfix

        -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#extras

        require("luasnip.loaders.from_lua").load({
            paths = "~/.config/nvim/lua/snippets"
        })

    end
}

return M

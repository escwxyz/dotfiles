--- Snippet Engine
--- ~~~~~~~~~~~~~~
--- https://github.com/L3MON4D3/LuaSnip#documentation

return {
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

        -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#extras

        require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/.config/nvim/lua/snippets"
        })

    end
}

--- Snippet Engine
--- ~~~~~~~~
--- https://github.com/L3MON4D3/LuaSnip#documentation

local M = {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    -- dependencies = {
    --     "rafamadriz/friendly-snippets",
    -- },
    config = function()
        local ls = require("luasnip")
        ls.config.setup({
            -- https://github.com/L3MON4D3/LuaSnip#config
        })

        -- extras for writing snippets easier

        -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#extras

        require("luasnip.loaders.from_lua").lazy_load({
            path = "~/.config/nvim/lua/snippets/" -- the directory to store all snippets
        })
    end
}

return M

--- Anotation
--- ~~~~~~~~~
--- https://github.com/danymat/neogen

return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
        require('neogen').setup({
            -- snippet_engine = "luasnip"
        })
    end
}

return {
    "danymat/neogen",
    enabled = true,
	cmd = "Neogen",
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
    end,
}

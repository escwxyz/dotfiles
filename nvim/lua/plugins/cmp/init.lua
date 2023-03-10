return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    dependencies = {
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
    },
    event = { "CmdlineEnter", "InsertEnter" },
    config = function()
        require("plugins.cmp.config").setup()
    end,
}

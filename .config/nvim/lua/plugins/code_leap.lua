--- Navigation inside buffer / window
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/ggandor/leap.nvim/blob/main/doc/leap.txt

return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
        "ggandor/flit.nvim"
    },
    event = "VeryLazy",
    config = function()
        local leap = require("leap")

        leap.opts.case_sensetive = true

        leap.add_default_mappings({ true }) -- NOTE overwrite other conflicting keymaps
        -- for faster move cursor with `fFtT`
        require("flit").setup({
            keys = { f = 'f', F = 'F', t = 't', T = 'T' },
            -- A string like "nv", "nvo", "o", etc.
            labeled_modes = "v",
            multiline = true,
            -- Like `leap`s similar argument (call-specific overrides).
            -- E.g.: opts = { equivalence_classes = {} }
            opts = {}
        })
    end,
}

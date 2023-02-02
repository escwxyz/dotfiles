return {
    "beauwilliams/focus.nvim",
    enabled = true,
    cmd = {
        "FocusSplitLeft",
        "FocusSplitDown",
        "FocusSplitRight",
        "FocusSplitUp",
    },
    config = function()
        require("focus").setup({
            -- hybridnumber = true,
            excluded_filetypes = { "FTerm", "GitUI" }, --TODO
            number = false,
        })
    end,
}

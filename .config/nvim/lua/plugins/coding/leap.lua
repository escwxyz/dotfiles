--- Navigation inside buffer / window
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/ggandor/leap.nvim/blob/main/doc/leap.txt

local M = {}

M.setup = function()
    -- for faster move cursor with `fFtT`
    require("flit").setup({
        keys = { f = "f", F = "F", t = "t", T = "T" },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {},
    })
end

M.search = function()
    require("leap").leap({ target_windows = { vim.fn.win_getid() } })
end

M.search_cross_window = function()
    require("leap").leap({
        target_windows = vim.tbl_filter(function(win)
            return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0)),
    })
end

return M

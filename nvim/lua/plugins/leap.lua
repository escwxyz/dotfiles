return {
    "ggandor/leap.nvim",
    dependencies = {
        { "tpope/vim-repeat" },
        { "ggandor/flit.nvim" }
    },
    enabled = true,
    cmd = { "LeapBuffer", "LeapWindow" },
    config = function()
        vim.api.nvim_create_user_command("LeapBuffer", function()
            require("leap").leap({ target_windows = { vim.fn.win_getid() } })
        end, {})

        vim.api.nvim_create_user_command("LeapWindow", function()
            require("leap").leap({
                target_windows = vim.tbl_filter(function(win)
                    return vim.api.nvim_win_get_config(win).focusable
                end, vim.api.nvim_tabpage_list_wins(0)),
            })
        end, {})
    end
}

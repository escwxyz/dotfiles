local M = {}

M.setup = function()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            initial_mode = "insert",
            entry_prefix = " ",
            scroll_strategy = "limit",
            results_title = false,
            layout_strategy = "horizontal",
            path_display = { "absolute" },
            file_ignore_patterns = {
                ".git/",
                ".cache",
                "%.class",
                "%.pdf",
                "%.mkv",
                "%.mp4",
                "%.zip",
            },
            layout_config = {
                horizontal = {
                    preview_width = 0.5,
                },
            },
            file_previewer = require("telescope.previewers").cat.new,
        },
        extensions = {
            -- TODO
        },
    })

    telescope.load_extension("repo")
    telescope.load_extension("fzf")
    telescope.load_extension("harpoon")
    telescope.load_extension("notify")

    require("hydras.telescope-hydra").init_hydra()
end

local function search_in_buffer()
    local ok, telescope = pcall(require, "telescope.builtin")
    if not ok then
        vim.notify("Telescope not initialized", vim.log.levels.ERROR)
        return
    end
    telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end

M.init_cmds = function()
    vim.api.nvim_buf_create_user_command(0, "SearchInBuffer", search_in_buffer, {})
end

return M

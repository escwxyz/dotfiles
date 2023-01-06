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

return M

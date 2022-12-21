--- File Finder
--- ~~~~~~~~~~~

local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        -- https://github.com/nvim-telescope/telescope-file-browser.nvim
        { "nvim-telescope/telescope-file-browser.nvim" },
        -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        -- https://github.com/nvim-telescope/telescope-project.nvim
        { "nvim-telescope/telescope-project.nvim" }
        -- TODO
    },
    init = function()

        local telescope = require("telescope")

        vim.keymap.set("n", "<leader>ff", function()
            telescope.extensions.file_browser.file_browser({}) -- TODO
        end, { desc = "Find files" })

        vim.keymap.set("n", "<leader>fp", function()
            telescope.extensions.project.project({})
        end, { desc = "Find projects" })

        vim.keymap.set("n", "<leader>fk", function()
            require("telescope.builtin").keymaps()
        end, { desc = "Show Keymaps" })
    end,

    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                project = {
                    base_dirs = {
                        -- TODO
                    },
                    sync_with_nvim_tree = true,
                },
                file_browser = {

                }
            },
            defaults = {
                initial_mode = "insert",
                entry_prefix = " ",
                scroll_strategy = "limit",
                results_title = false,
                layout_strategy = "horizontal",
                path_display = { "absolute" },
                file_ignore_patterns = { ".git/", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
                layout_config = {
                    horizontal = {
                        preview_width = 0.5,
                    },
                },
                file_previewer = require("telescope.previewers").cat.new, -- use cat/bat for file pre
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("project")
    end
}


return M

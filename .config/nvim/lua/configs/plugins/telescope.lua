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

        -- Mainly use this as file explorer
        vim.keymap.set("n", "<leader>ff", function()
            telescope.extensions.file_browser.file_browser({}) -- TODO
        end, { desc = "[F]ind [F]iles" })

        vim.keymap.set("n", "<leader>fp", function()
            telescope.extensions.project.project({})
        end, { desc = "[F]ind [P]rojects" })

        vim.keymap.set("n", "<leader>fk", function()
            require("telescope.builtin").keymaps()
        end, { desc = "[F]ind [K]eymaps" })

        vim.keymap.set("n", "<leader>fs", function()
            require("telescope.builtin").live_grep()
        end, { desc = "[F]ind a [S]tring" })

    end,

    config = function()
        local telescope = require("telescope")

        local fb_actions = telescope.extensions.file_browser.actions

        telescope.setup({
            extensions = {
                -- TODO keymapping for project
                project = {
                    base_dirs = {
                        "~/Projects/"
                    },
                    sync_with_nvim_tree = true,
                },
                file_browser = {
                    -- https://github.com/nvim-telescope/telescope-file-browser.nvim#file-system-operations
                    hijack_netrw = true,
                    grouped = true,
                    mappings = {
                        -- Note: normal mode
                        ["n"] = {
                            -- TODO we need description for these operations
                            ["<leader><leader>n"] = fb_actions.create_from_prompt, -- create file / folder
                            ["<leader><leader>r"] = fb_actions.rename, -- rename file / folder
                            ["<leader><leader>m"] = fb_actions.move, -- move file / folder
                            ["<leader><leader>c"] = fb_actions.copy, -- copy file / folder
                            ["<leader><leader>d"] = fb_actions.remove, -- delete file / folder,
                            ["<leader><leader>s"] = fb_actions.select_all, -- select all files / folders
                        },

                    }

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
                file_previewer = require("telescope.previewers").cat.new, -- use cat/bat for file preview
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("project")
    end
}


return M

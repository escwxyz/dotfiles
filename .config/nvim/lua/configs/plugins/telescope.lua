--- All in One Finder
--- ~~~~~~~~~~~
--- https://github.com/nvim-telescope/telescope.nvim

local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "cljoly/telescope-repo.nvim" },
        { "lazytanuki/nvim-mapper" }
    },
    init = function()

        local telescope = require("telescope")

        telescope.setup({
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
                file_previewer = require("telescope.previewers").cat.new,
            }
        })

        require("nvim-mapper").setup({
            no_map = true,
            search_path = "~/.config/nvim/lua/configs/plugins/",
            action_on_enter = "definition" -- TODO definition is not shown up in the preview
        })


        telescope.load_extension("mapper")

    end,

    config = function()
        local telescope = require("telescope")

        local fb_actions = telescope.extensions.file_browser.actions

        telescope.setup({
            extensions = {
                repo = {
                    list = {
                        search_dirs = {
                            "~./Projects/"
                        }
                    }
                },
                file_browser = {
                    -- https://github.com/nvim-telescope/telescope-file-browser.nvim#file-system-operations
                    hijack_netrw = true,
                    grouped = true,
                    mappings = {
                        -- Note: normal mode
                        ["n"] = {
                            ["<leader><leader>n"] = fb_actions.create_from_prompt, -- create file / folder
                            ["<leader><leader>r"] = fb_actions.rename, -- rename file / folder
                            ["<leader><leader>m"] = fb_actions.move, -- move file / folder
                            ["<leader><leader>c"] = fb_actions.copy, -- copy file / folder
                            ["<leader><leader>d"] = fb_actions.remove, -- delete file / folder,
                            ["<leader><leader>s"] = fb_actions.select_all, -- select all files / folders
                        },
                        ["i"] = {
                            ["<leader><leader>n"] = fb_actions.create_from_prompt,
                            ["<leader><leader>r"] = fb_actions.rename,
                            ["<leader><leader>m"] = fb_actions.move,
                            ["<leader><leader>c"] = fb_actions.copy,
                            ["<leader><leader>d"] = fb_actions.remove,
                            ["<leader><leader>s"] = fb_actions.select_all,
                        },

                    }

                }
            },

        })

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("repo")
        -- https://github.com/ThePrimeagen/harpoon#telescope-support
        telescope.load_extension("harpoon")


        -- keymapping

        local key_map = require("nvim-mapper")


        key_map.map({ "n", "i" }, "<leader>ff", function()
            telescope.extensions.file_browser.file_browser()
        end, { silent = true }, "Telescope", "file_browser", "[F]ind [F]iles")

        key_map.map({ "n", "i" }, "<leader>fk", "<cmd>:Telescope mapper<cr>",
            { silent = true },
            "Telescope", "nvim_mapper", "[F]ind [K]eymaps")

        -- TODO if buffer only?
        key_map.map("n", "<leader>fs", function()
            require("telescope.builtin").live_grep()
        end, { silent = true }, "Telescope", "live_grep", "[F]ind a [S]tring")

        key_map.map({ "n", "i" }, "<leader>?", require("telescope.builtin").help_tags, { silent = true }, "Telescope",
            "help_tags", "Help Tags")

        key_map.map({ "n", "i" }, "<leader>fc", function()
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { silent = true }, "Telescope", "search_inside_buffer", "Search inside buffer")

        key_map.map_virtual({ "n", "i" }, "<leader><leader>n", "", { silent = true }, "Telescope",
            "file_browser_create_new", "Create [N]ew File or Folder")
        key_map.map_virtual({ "n", "i" }, "<leader><leader>r", "", { silent = true }, "Telescope",
            "file_browser_rename", "[R]ename File or Folder")
        key_map.map_virtual({ "n", "i" }, "<leader><leader>m", "", { silent = true }, "Telescope",
            "file_browser_move", "[M]ove File or Folder")
        key_map.map_virtual({ "n", "i" }, "<leader><leader>c", "", { silent = true }, "Telescope",
            "file_browser_copy", "[C]opy File or Folder")
        key_map.map_virtual({ "n", "i" }, "<leader><leader>d", "", { silent = true }, "Telescope",
            "file_browser_delete", "[D]elete File or Folder")
        key_map.map_virtual({ "n", "i" }, "<leader><leader>s", "", { silent = true }, "Telescope",
            "file_browser_select_all", "[S]elect All Files and Folders")

        key_map.map({ "n", "i" }, "<leader>fr", function()
            require("telescope").extensions.repo.list({
                search_dirs = { "~/Projects" }
            })
        end, {}, "Telescope", "list_repos", "[F]ind GitHub [R]epos")

    end
}

return M

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
        local mapper = require("nvim-mapper")

        local key_map = function(key, func, group, id, desc)
            mapper.map({ "n", "i" }, key, func, { silent = true }, group, id, desc)
        end

        local key_map_virtual = function(key, group, id, desc)
            mapper.map_virtual({ "n", "i" }, key, "", {}, group, id, desc)
        end

        -- File Browser
        key_map("<leader>fb", telescope.extensions.file_browser.file_browser, "File Browser", "file_browser",
            "[F]ile [B]rowser")
        key_map_virtual("<leader><leader>n", "File Browser", "file_browser_new", "File Browser Create New")
        key_map_virtual("<leader><leader>r", "File Browser", "file_browser_renmae", "File Browser Remove File / Folder")
        key_map_virtual("<leader><leader>m", "File Browser", "file_browser_move", "File Browser Move File / Folder")
        key_map_virtual("<leader><leader>d", "File Browser", "file_browser_delete", "File Browser Delete File / Folder")
        key_map_virtual("<leader><leader>c", "File Browser", "file_browser_copy", "File Browser Copy File / Folder")

        key_map("<leader>fk", "<cmd>:Telescope mapper<cr>", "Telescope", "find_keymaps", "[F]ind [K]eymaps")
        key_map("<leader>?", require("telescope.builtin").help_tags, "Telescope", "help_tags", "Help Tags")

        key_map("<leader>ff", require("telescope.builtin").find_files, "Telescope", "find_files", "[F]ind [F]iles")

        key_map("<leader>fs", function()
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, "Telescope", "find_string_inside_buffer", "[F]ind [S]tring Inside Buffer")

        key_map("<leader>fr", function()
            require("telescope").extensions.repo.list({
                search_dirs = { "~/Projects" }
            })
        end, "Telescope", "list_repos", "[F]ind GitHub [R]epos")

    end
}

return M

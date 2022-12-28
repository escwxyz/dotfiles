return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "cljoly/telescope-repo.nvim",
        "debugloop/telescope-undo.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    },
    keys = {
        "<leader>f"
    },

    config = function()
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
            },
            extensions = {
                aerial = {
                    -- Display symbols as <root>.<parent>.<symbol>
                    show_nesting = {
                        ['_'] = false, -- This key will be the default
                        json = true, -- You can set the option for specific filetypes
                        yaml = true,
                    }
                },
                repo = {
                    list = {
                        search_dirs = {
                            "~./Projects/"
                        }
                    }
                },
                -- TODO
                undo = {
                    use_delta = true, -- this is the default
                    side_by_side = false, -- this is the default
                    mappings = { -- this whole table is the default
                        i = {
                            -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                            -- you want to use the following actions. This means installing as a dependency of
                            -- telescope in it's `requirements` and loading this extension from there instead of
                            -- having the separate plugin definition as outlined above. See issue #6.
                            ["<cr>"] = require("telescope-undo.actions").yank_additions,
                            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                            ["<C-cr>"] = require("telescope-undo.actions").restore,
                        },
                    },
                }
            },

        })

        telescope.load_extension("undo")
        telescope.load_extension("repo")
        telescope.load_extension("fzf")
        -- https://github.com/ThePrimeagen/harpoon#telescope-support
        telescope.load_extension("harpoon")
        -- https://github.com/stevearc/aerial.nvim#telescope
        telescope.load_extension("aerial")

        local Hydra = require("hydra")

        local cmd = require('hydra.keymap-util').cmd

        local hint = [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀_f_: Find Files
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⠿⣿⣦⠀⠀⠀⠀⠀⠀⠀_r_: Find Repos
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣭⡣⣽⣶⣿⠟⠁⠀⠀⠀⠀⠀⠀_h_: Help Tags
    ⠀⠀⠀⠀⠀⡀⠀⠀⢀⡤⢿⡉⠹⣷⡿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀_t_: Find Todos
    ⠀⠀⠀⣠⡾⠃⢠⢴⡅⠀⣈⣿⡺⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_m_: Harpoon Marks
    ⠀⠀⠘⠋⠈⠽⣇⠀⡽⠿⠟⣻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_a_: Aerial Outline
    ⠀⠀⠐⢶⣿⠗⠚⠉⠀⢰⣿⢻⣿⣿⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_k_: Keymaps
    ⠀⠀⠀⠀⠀⠀⠀⠀⡰⡫⠃⢸⢸⠈⣯⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_o_: Vim Options
    ⠀⠀⠀⠀⠀⠀⠀⡰⡳⠁⠀⢸⢸⠀⠘⡲⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀_/_: Search in buffer 
    ⠀⠀⠀⠀⠀⠀⣰⡥⠁⠀⢀⣼⣼⠀⠀⢳⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀_u_: Undo Tree
    ⠀⠀⠀⠀⢀⡾⣵⠥⠔⠚⠛⢻⠟⠛⠒⠤⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀_g_: Live Grep
    ⠀⠀⠀⠀⣼⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⡞⡀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠼⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⠀⠀⠀⠀⠀⠀_<Esc>_: Exit
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]]
        Hydra({
            name = "Telescope",
            hint = hint,
            config = {
                color = 'teal',
                invoke_on_body = true,
                hint = {
                    position = 'middle',
                    border = 'rounded',
                },
            },
            mode = { "n", "i" },
            body = '<leader>f',
            heads = {
                { "f", cmd "Telescope find_files", { desc = "Find Files" } },
                { "r", function()
                    require("configs.plugins.telescope.repo")
                    require("telescope").extensions.repo.list({
                        search_dirs = { "~/Projects" }
                    })
                end, { desc = "Find Repos" } },
                { "t", cmd "TodoTelescope", { desc = "Find Todos" } },
                { "a", cmd "Telescope aerial", { desc = "Aerial Code Outline" } },
                { 'g', cmd 'Telescope live_grep' },
                { "h", cmd "Telescope help_tags", { desc = "vim help" } },
                { 'm', cmd 'Telescope harpoon marks', { desc = 'Find Harpoon Marks' } },
                { 'k', cmd 'Telescope keymaps' },
                { 'o', cmd 'Telescope vim_options' },
                { '/', function()
                    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end, { desc = 'search string inside buffer' } },
                { 'u', cmd 'Telescope undo', { exit = true, desc = 'undotree' } },
                { '<Esc>', nil, { exit = true, nowait = true } },
            }
        })
    end
}

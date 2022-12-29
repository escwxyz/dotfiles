return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "cljoly/telescope-repo.nvim",
        "debugloop/telescope-undo.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = "<leader>f",
    cmd = "Telescope",
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
        --  telescope.load_extension("notify")

        local Hydra = require("hydra")

        local hint = [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀_f_: Find Files
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⠿⣿⣦⠀⠀⠀⠀⠀⠀⠀_r_: Find Repos
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣭⡣⣽⣶⣿⠟⠁⠀⠀⠀⠀⠀⠀_h_: Help Tags
    ⠀⠀⠀⠀⠀⡀⠀⠀⢀⡤⢿⡉⠹⣷⡿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀_t_: Find Todos
    ⠀⠀⠀⣠⡾⠃⢠⢴⡅⠀⣈⣿⡺⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_m_: Harpoon Marks
    ⠀⠀⠘⠋⠈⠽⣇⠀⡽⠿⠟⣻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_a_: Aerial Outline
    ⠀⠀⠐⢶⣿⠗⠚⠉⠀⢰⣿⢻⣿⣿⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_k_: Keymaps
    ⠀⠀⠀⠀⠀⠀⠀⠀⡰⡫⠃⢸⢸⠈⣯⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_o_: Vim Options
    ⠀⠀⠀⠀⠀⠀⠀⡰⡳⠁⠀⢸⢸⠀⠘⡲⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀_b_: Search in buffer 
    ⠀⠀⠀⠀⠀⠀⣰⡥⠁⠀⢀⣼⣼⠀⠀⢳⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀_u_: Undo Tree
    ⠀⠀⠀⠀⢀⡾⣵⠥⠔⠚⠛⢻⠟⠛⠒⠤⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀_g_: Live Grep
    ⠀⠀⠀⠀⣼⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⡞⡀⠀⠀⠀⠀⠀⠀⠀_n_: Notify
    ⠀⠀⠀⠼⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_<Esc>_: Exit
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
                { "f", "<leader>ff", { remap = true } },
                { "r", "<leader>fr", { remap = true } },
                { "t", "<leader>ft", { remap = true } },
                { "a", "<leader>fa", { remap = true } },
                { "g", "<leader>fg", { remap = true } },
                { "h", "<leader>fh", { remap = true } },
                { "m", "<leader>fm", { remap = true } },
                { "k", "<leader>fk", { remap = true } },
                { "o", "<leader>fo", { remap = true } },
                { "b", "<leader>fb", { remap = true } },
                { "u", "<leader>fu", { remap = true } },
                { "n", "<leader>fn", { remap = true } },
                { "<Esc>", nil, { exit = true, nowait = true } },
            }
        })
    end
}

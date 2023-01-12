local M = {}

M.setup = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

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

            mappings = {
                i = {
                    ["<C-n>"] = false,
                    ["<C-p>"] = false,

                    ["<C-c>"] = false,

                    -- ["<Down>"] = false,
                    -- ["<Up>"] = false,
                    --
                    -- ["<CR>"] = false,
                    ["<C-x>"] = false,
                    ["<C-v>"] = false,
                    ["<C-t>"] = false,

                    ["<C-u>"] = false,
                    ["<C-d>"] = false,

                    ["<PageUp>"] = false,
                    ["<PageDown>"] = false,

                    -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    -- ["<Tab>"] = false,
                    ["<C-q>"] = false,
                    ["<M-q>"] = false,
                    ["<C-l>"] = false,
                    ["<C-/>"] = false,
                    ["<C-_>"] = false, -- keys from pressing <C-/>
                    ["<C-w>"] = false,

                    -- disable c-j because we dont want to allow new lines #2123
                    ["<C-j>"] = false,
                },
                -- TODO

                n = {
                    ["<C-x>"] = false,
                    ["<C-v>"] = false,
                    ["<C-t>"] = false,

                    ["<C-q>"] = false,
                    ["<M-q>"] = false,

                    -- TODO: This would be weird if we switch the ordering.
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,
                    ["gg"] = false,
                    ["G"] = false,
                    ["gt"] = actions.move_to_top,
                    ["gb"] = actions.move_to_bottom,

                    ["<C-u>"] = false,
                    ["<C-d>"] = false,

                    ["<PageUp>"] = false,
                    ["<PageDown>"] = false,

                    ["?"] = false,
                },
            },
        },
        -- config builtin pickers
        pickers = {
            colorscheme = {
                enable_preview = true,
            },
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

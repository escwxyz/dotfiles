local M = {}

local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local dropdown = require("telescope.themes").get_dropdown()
local sad = require("utils").sad

local init_path = "~/.config/nvim/init.lua"

local function select_theme(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    vim.cmd("colorscheme " .. selected[1])
    -- NOTE you cannot change the init.lua unless also update here
    sad("07", vim.g.Theme, selected[1], init_path)
    actions.close(prompt_bufnr)
end

local function next_theme(prompt_bufnr)
    actions.move_selection_next(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    vim.cmd("colorscheme " .. selected[1])
end

local function prev_theme(prompt_bufnr)
    actions.move_selection_previous(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    vim.cmd("colorscheme " .. selected[1])
end

local themes = vim.fn.getcompletion("", "color")

M.find_themes = function()
    local picker = pickers.new(dropdown, {
        prompt_title = "Change Colorscheme",
        finder = finders.new_table(themes),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map) -- NOTE map not supports multiple modes
            map("i", "<CR>", select_theme)
            map("i", "<Tab>", next_theme)
            map("i", "<S-Tab>", prev_theme)

            map("n", "<CR>", select_theme)
            map("n", "<Tab>", next_theme)
            map("n", "<S-Tab>", prev_theme)

            return true
        end,
    })

    picker:find()
end

-- TODO need to improve the code
-- M.save_theme = function(theme)
--     sqlite:with_open(function()
--         sqlite:delete("theme", { where = { id = 1 } })
--         sqlite:insert("theme", { id = 1, name = theme })
--     end)
-- end
--
-- M.get_theme = function()
--     return sqlite:with_open(function()
--         return sqlite:select("theme", { where = { id = 1 } })
--     end)
-- end
--
-- M.init_theme = function()
--     local t = M.get_theme()
--     vim.g.Theme = #t > 0 and t[1]["name"] or "base16-catppuccin"
--     vim.cmd("colorscheme " .. vim.g.Theme)
-- end
--
return M

local M = {}

local Hydra = require("hydra")

local theme_list = require("configs.themes").theme_list

local function get_heads()
    local heads = {}
    for k, v in ipairs(theme_list) do
        table.insert(heads, {
            tostring(k),
            function()
                vim.g.Theme = "base16-" .. v
                vim.cmd("colorscheme " .. vim.g.Theme)
            end,
        })
    end
    table.insert(heads, { "q", nil })
    return heads
end

local heads = get_heads()

local function get_hint()
    local hint = [[

	]]
    for k, v in ipairs(theme_list) do
        local separator = math.fmod(k, 3) == 0 and [[   

    ]] or [[ ]]
        hint = hint .. [[_]] .. tostring(k) .. [[_: ]] .. string.format("%-15s", v) .. separator
    end
    return hint .. [[
^^_q_: exit
	]]
end

M.init_hydra = function()
    return Hydra({
        name = "Themes",
        config = {
            color = "teal",
            hint = {
                position = "middle",
                border = "rounded",
            },
        },
        hint = get_hint(),
        heads = heads,
    })
end

return M

local M = {}

local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local urlview_hydra = Hydra({
    name = "URL",
    config = {
        color = "teal",
        -- hint = {
        --     position = "middle",
        --     border = "rounded",
        -- },
        hint = false,
    },
    --    hint = require("hydras.hints").urlview_hint,
    heads = {
        { "b", cmd("UrlView"), { desc = "buffer links" } },
        { "p", cmd("UrlView lazy"), { desc = "plugin links" } },
        { "q", nil, { desc = "quit" } },
    },
})

M.init_hydra = function()
    return urlview_hydra
end

M.activate = function()
    urlview_hydra:activate()
end

return M

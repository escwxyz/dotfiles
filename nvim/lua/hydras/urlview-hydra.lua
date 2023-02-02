local M = {}

local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local urlview_hydra = Hydra({
    name = "URL",
    config = {
        -- hint = false, --NOTE set to false to show on statusline - switch back when fully fix the statusbar
        hint = {
            position = "middle",
        },
    },
    hint = require("hydras.hints").urlview_hint,
    heads = {
        { "b", cmd("UrlView"), { desc = "buffer links", exit = true } },
        { "p", cmd("UrlView lazy"), { desc = "plugin links", exit = true } },
        { "q", nil, { desc = "quit", exit = true } },
    },
})

M.activate = function()
    urlview_hydra:activate()
end

return M

local M = {}

local splits = require("smart-splits")

local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd
local pcmd = require("hydra.keymap-util").pcmd

-- TODO key remapping

local windows_hydra = Hydra({
    name = "Windows",
    hint = require("hydras.hints").windows_hint,
    config = {
        invoke_on_body = true,
        hint = {
            border = "rounded",
        },
    },
    mode = "n",
    heads = {
        { "h", "<C-w>h" },
        { "j", "<C-w>j" },
        { "k", pcmd("wincmd k", "E11", "close") },
        { "l", "<C-w>l" },

        { "H", cmd("WinShift left") },
        { "J", cmd("WinShift down") },
        { "K", cmd("WinShift up") },
        { "L", cmd("WinShift right") },

        {
            "<C-h>",
            function()
                splits.resize_left(2)
            end,
        },
        {
            "<C-k>",
            function()
                splits.resize_up(2)
            end,
        },
        {
            "<C-l>",
            function()
                splits.resize_right(2)
            end,
        },
        { "=", "<C-w>=", { desc = "equalize" } },

        { "s", pcmd("split", "E36") },
        { "<C-s>", pcmd("split", "E36"), { desc = false } },
        { "v", pcmd("vsplit", "E36") },
        { "<C-v>", pcmd("vsplit", "E36"), { desc = false } },

        { "w", "<C-w>w", { exit = true, desc = false } },
        { "<C-w>", "<C-w>w", { exit = true, desc = false } },

        { "z", cmd("WindowsMaximaze"), { exit = true, desc = "maximize" } },
        { "<C-z>", cmd("WindowsMaximaze"), { exit = true, desc = false } },

        { "o", "<C-w>o", { exit = true, desc = "remain only" } },
        { "<C-o>", "<C-w>o", { exit = true, desc = false } },

        {
            "b",
            function()
                -- TODO
            end,
            --require("plugins.ui.plugin_bufferline").choose_buffer,
            { exit = true, desc = "choose buffer" },
        },

        { "c", pcmd("close", "E444") },
        { "q", pcmd("close", "E444"), { desc = "close window" } },
        { "<C-c>", pcmd("close", "E444"), { desc = false } },
        { "<C-q>", pcmd("close", "E444"), { desc = false } },

        { "<Esc>", nil, { exit = true, desc = false } },
    },
})
M.activate = function()
    windows_hydra:activate()
end

return M

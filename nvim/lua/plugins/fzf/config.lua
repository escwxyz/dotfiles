local M = {}
--TODO adjust highlights
local colorschemes = {
    prompt = "Colorschemes> ",
    live_preview = true,
    actions = {
        ["default"] = function(selected)
            local colorscheme = selected[1]
            vim.cmd.colorscheme(colorscheme)
            require("utils").sad(
                "01",
                vim.g.Theme,
                colorscheme,
                "~/.config/nvim/lua/configs/colorscheme.lua"
            )
        end,
    },
    winopts = { height = 0.55, width = 0.30 },
    post_reset_cb = function() end,
}

local files = {
    prompt = "Files> ",
}

M.setup = function()
    local fzf = require("fzf-lua")
    fzf.setup({
        winopts = {
            preview = {
                -- default = "bat",
                default = "bat_async", -- see https://github.com/ibhagwan/fzf-lua/issues/615
            },
        },
        previewers = {
            bat = {
                theme = "base16-256",
            },
        },
        files = files,
        colorschemes = colorschemes,
    })
end

M.setup_cmds = function()
    local fzf = require("fzf-lua")
    vim.api.nvim_create_user_command("FindProjects", function()
        local cmd = "fd --type d . " .. "~/Projects" .. " " .. "~/.config"
        fzf.fzf_exec(cmd, {
            prompt = "Projects: ",
            fn_transform = function(x)
                return fzf.utils.ansi_codes.magenta(x)
            end,
            actions = {
                ["default"] = function(selected)
                    vim.cmd("cd " .. selected[1]) -- change working directory
                    vim.cmd(":enew") -- open an empty buffer in new directory
                end,
            },
        })
    end, {})

    vim.api.nvim_create_user_command("FindCommands", function()
        fzf.commands({ winopts = { preview = { hidden = "hidden" }, height = 0.60, width = 0.30 } })
    end, {})
end
return M

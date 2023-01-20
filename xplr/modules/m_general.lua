local M = {}
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local general = xplr.config.general

M.setup = function()
    general.disable_debug_error_mode = false
    general.enable_mouse = true
    general.show_hidden = true
    general.prompt = { format = "> ", style = {} }
end

local logs = general.logs

M.setup_logs = function()
    logs.info = { format = "INFO", style = { fg = "LightBlue" } }
    logs.success = { format = "SUCCESS", style = { fg = "Green" } }
    logs.warning = { format = "WARNING", style = { fg = { Rgb = { 252, 140, 3 } } } }
    logs.error = { format = "ERROR", style = { fg = "Red" } }
end

M.setup_ui = function()
    general.focus_ui = {
        prefix = "  ",
        suffix = " ",
        style = {
            add_modifiers = {
                "Bold",
            },
            fg = "Green",
        },
    }

    general.selection_ui = {
        style = {
            add_modifiers = {
                "Italic",
            },
        },
    }

    general.focus_selection_ui = {
        style = {
            add_modifiers = {
                "Bold",
                "Italic",
            },
        },
    }
end

M.setup_panel_ui = function ()
	
end

return M

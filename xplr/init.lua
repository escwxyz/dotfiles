version = "0.20.2"
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local home = os.getenv("HOME")

package.path = home
    .. "/.config/xplr/plugins/?/init.lua;"
    .. home
    .. "/.config/xplr/plugins/?.lua;"
    .. home
    .. "/.config/xplr/modules/?/init.lua;"
    .. home
    .. "/.config/xplr/modules/?.lua;"
    .. package.path

-- # Plugins

require("icons").setup()

require("command-mode").setup({
    mode = "default",
    key = ":",
    remap_action_mode_to = {
        mode = "default",
        key = ";",
    },
})

-- # Configs

-- ## General

require("m_general").setup()

require("m_general").setup_logs()

-- ## UI

require("m_general").setup_ui()

-- ## Modes

require("m_modes").setup_default()

-- ## Node Types
-- require("m_node_types").setup()
--
-- ## Functions

require("m_functions").setup()

return {
    on_load = {},
    on_directory_change = {},
    on_focus_change = {},
    on_mode_switch = {},
    on_layout_switch = {},
}

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
-- # Configurations ------------------------------------------------------------
-- ## Config ------------------------------------------------------------------
require("m_general").setup()

require("m_general").setup_logs()

require("m_general").setup_ui()

-- ## Node Types
-- require("m_node_types").setup()
require("m_functions").setup()
-- ### General Configuration --------------------------------------------------

-- ## Hooks -------------------------------------------------------------------
--
-- Example:
--
-- ```lua
-- return {
--   -- Add messages to send when the xplr loads.
--   -- This is similar to the `--on-load` command-line option.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_load = {
--     { LogSuccess = "Configuration successfully loaded!" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_load" },
--   },
--
--   -- Add messages to send when the directory changes.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_directory_change = {
--     { LogSuccess = "Changed directory" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_directory_change" },
--   },
--
--   -- Add messages to send when the focus changes.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_focus_change = {
--     { LogSuccess = "Changed focus" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_focus_change" },
--   }
--
--   -- Add messages to send when the mode is switched.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_mode_switch = {
--     { LogSuccess = "Switched mode" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_mode_switch" },
--   }
--
--   -- Add messages to send when the layout is switched
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_layout_switch = {
--     { LogSuccess = "Switched layout" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_layout_switch" },
--   }
-- }
-- ```

return {
    on_load = {},
    on_directory_change = {},
    on_focus_change = {},
    on_mode_switch = {},
    on_layout_switch = {},
}

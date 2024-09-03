-- Pull in the wezterm API
local wezterm = require("wezterm")

local appearance = require("modules.appearance")
local keymaps = require("modules.keymaps")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono", {
  weight = "Medium",
})

config.font_size = 12

appearance.apply_to_config(config)
keymaps.apply_config(config)

bar.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config

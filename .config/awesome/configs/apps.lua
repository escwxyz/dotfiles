local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()

local rofi_dir = os.getenv("HOME") .. "/.config/rofi/"

local rofi_launcher_dir = rofi_dir .. "/launchers/type-3/"

return {
	--- Default Applications
	default = {
		terminal     = "kitty",
		web_browser  = "firefox",
		file_manager = "dolphin",
	},

	app_launcher = rofi_launcher_dir .. "launcher.sh",

	utils = {
		-- bluetooth    = utils_dir .. "apps/rofi_bluetooth",
		-- app_launcher = utils_dir .. "apps/rofi_app_launcher",
	},
}

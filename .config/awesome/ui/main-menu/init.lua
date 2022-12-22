-- TODO polish

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("configs.apps")
local focused = awful.screen.focused()

--- Beautiful right-click menu
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~

local instance = nil

local function widget()
	return awful.menu({
		items = {
			{
				"Terminal", function()
					awful.spawn(apps.default.terminal, false)
				end
			},
			{
				"Awesome", {
					{
						"help", function()
							hotkeys_popup.show_help(nil, awful.screen.focused())
						end
					},
					{
						"Restart", function()
							awesome.restart()
						end
					},
					{
						"Quit", function()
							awesome.quit()
						end
					}
				}
			}
		}
	})

end

if not instance then
	instance = widget()
end
return instance

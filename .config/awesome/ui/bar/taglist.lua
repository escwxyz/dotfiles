local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local animation = require("modules.animation")


return function(s)
	local modkey = "Mod4"

	-- TODO 预览桌面功能 https://blingcorp.github.io/bling/#/widgets/tag_preview
	local taglist_buttons = gears.table.join(
		awful.button({}, 1, function(t)
			t:view_only()
		end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({}, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({}, 4, function(t)
			awful.tag.viewnext(t.screen)
		end),
		awful.button({}, 5, function(t)
			awful.tag.viewprev(t.screen)
		end)
	)

	local function tag_list()
		local taglist = awful.widget.taglist({
			screen = s,
			filter = awful.widget.taglist.filter.all,
			layout = { layout = wibox.layout.fixed.horizontal },
			widget_template = {
				widget = wibox.container.margin,
				forced_width = dpi(40),
				forced_height = dpi(15),
				create_callback = function(self, c3, _)
					local indicator = wibox.widget({
						widget = wibox.container.place,
						valign = "center",
						{
							widget = wibox.container.background,
							forced_height = dpi(5),
							shape = gears.shape.rounded_bar,
						},
					})

					self.indicator_animation = animation:new({
						duration = 0.125,
						easing = animation.easing.linear,
						update = function(_, pos)
							indicator.children[1].forced_width = pos
						end,
					})

					self:set_widget(indicator)

					if c3.selected then
						self.widget.children[1].bg = beautiful.wibar_focused,
							self.indicator_animation:set(dpi(20))
					elseif #c3:clients() == 0 then
						self.widget.children[1].bg = beautiful.wibar_empty,
							self.indicator_animation:set(dpi(10))
					else
						self.widget.children[1].bg = beautiful.wibar_occupied,
							self.indicator_animation:set(dpi(10))
					end

					-- todo

					self:connect_signal('mouse::enter', function()

						print("hover")

						-- BLING: Only show widget when there are clients in the tag
						if #c3:clients() > 0 then
							-- BLING: Update the widget with the new tag
							awesome.emit_signal("bling::tag_preview::update", c3)
							-- BLING: Show the widget
							awesome.emit_signal("bling::tag_preview::visibility", s, true)
						end

						if self.bg ~= '#ff0000' then
							self.backup     = self.bg
							self.has_backup = true
						end
						self.bg = '#ff0000'
					end)

					self:connect_signal('mouse::leave', function()

						-- BLING: Turn the widget off
						awesome.emit_signal("bling::tag_preview::visibility", s, false)

						if self.has_backup then self.bg = self.backup end
					end)

				end,
				update_callback = function(self, c3, _)
					if c3.selected then
						self.widget.children[1].bg = beautiful.wibar_focused,
							self.indicator_animation:set(dpi(20))
					elseif #c3:clients() == 0 then
						self.widget.children[1].bg = beautiful.wibar_empty,
							self.indicator_animation:set(dpi(10))
					else
						self.widget.children[1].bg = beautiful.wibar_occupied,
							self.indicator_animation:set(dpi(10))
					end
				end,
			},
			buttons = taglist_buttons,
		})

		return wibox.widget({
			taglist,
			margins = dpi(8),
			widget = wibox.container.margin,
		})
	end

	return tag_list()
end

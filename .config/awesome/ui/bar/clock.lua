local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local wbutton = require("ui.widgets.button")

--- Clock Widget
--- ~~~~~~~~~~~~

return function()

  local clock = wibox.widget({
    widget = wibox.widget.textclock,
    format = "%a %b %e %l:%M %p",
    align = "center",
    valign = "center",
    font = beautiful.font_name .. "Medium 10",
  })

  local widget = wibox.container.background()
  widget:set_widget(clock)
  widget:set_fg(beautiful.wibar_clock)

  widget:connect_signal("mouse::enter", function()
    awesome.emit_signal("calendar::visibility", true)
  end)

  widget:connect_signal("mouse::leave", function()
    awesome.emit_signal("calendar::visibility", false)
  end)

  return widget
end

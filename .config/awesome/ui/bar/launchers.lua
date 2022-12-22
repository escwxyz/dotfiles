-- █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█ █▀▀ █▀█ █▀
-- █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█ ██▄ █▀▄ ▄█

local beautiful = require("beautiful")
local wibox     = require("wibox")
local colorize  = require("helpers").ui.colorize_text

local function create_launcher(icon, signal, color)
  local button = wibox.widget({
    markup = colorize(icon, color),
    widget = wibox.widget.textbox,
    font = beautiful.font_name .. "12",
    align = "center",
    valign = "center",
  })
  button:connect_signal("button::press", function()
    awesome.emit_signal(signal)
  end)
  button:connect_signal("mouse::enter", function()
    button:set_markup_silently(colorize(icon, beautiful.wibar_launch_hover))
  end)
  button:connect_signal("mouse::leave", function()
    button:set_markup_silently(colorize(icon, color))
  end)
  return button
end

return {
  create_launcher("📁", "dash::toggle", beautiful.wibar_launch_dash),
  create_launcher("🗒", "control_center::toggle", beautiful.wibar_launch_ctrl),
  create_launcher("🎨", "theme_switcher::toggle", beautiful.wibar_launch_theme),
}

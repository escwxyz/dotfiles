local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

return function(s)
  local clock = require("ui.bar.clock")
  -- local battery = require("ui.bar.battery")
  local volume = require("ui.bar.volume")
  local brightness = require("ui.bar.brightness")
  local systray = require("ui.bar.systray")
  local taglist = require("ui.bar.taglist")
  -- local git = require("ui.bar.git_backup")
  local notif = require("ui.bar.notif")
  local launchers = require("ui.bar.launchers")


  -- Assemble bar
  s.bar = awful.popup({
    screen = s,
    type = "dock",
    minimum_width = s.geometry.width,
    maximum_width = s.geometry.width,
    minimum_height = beautiful.wibar_height,
    maxium_height = beautiful.wibar_height,
    placement = function(c)
      awful.placement.top(c)
    end,
    widget = {
      {
        {
          layout = wibox.layout.align.horizontal,
          expand = "none",
          {
            { -- TODO
              launchers[1],
              launchers[2],
              launchers[3],
              -- git,
              spacing = dpi(15),
              layout = wibox.layout.fixed.horizontal,
            },
            left = dpi(8),
            widget = wibox.container.margin,
          },
          --- Tag List
          taglist(s),
          {
            {
              -- brightness,
              -- volume,
              notif,
              clock(),
              -- layout,
              -- battery,
              -- systray,
              spacing = dpi(8),
              layout = wibox.layout.fixed.horizontal,
            },
            right = dpi(6),
            widget = wibox.container.margin,
          },
        },
        top = dpi(3),
        bottom = dpi(3),
        widget = wibox.container.margin,
      },
      bg = beautiful.wibar_bg .. "55", -- todo transparency
      widget = wibox.container.background,
    },
  })

  -- reserve screen space
  s.bar:struts({
    top = s.bar.maximum_height,
  })

  -- SETTINGS --
  -- Bar visibility -- TODO 进入桌面后，状态栏从顶部进入
  local function remove_bar(c)
    if c.fullscreen or c.maximized then
      c.screen.bar.visible = false
    else
      c.screen.bar.visible = true
    end
  end

  -- i dont really understand this one
  local function add_bar(c)
    if c.fullscreen or c.maximized then
      c.screen.bar.visible = true
    end
  end

  --client.connect_signal("property::fullscreen", remove_bar)
  --client.connect_signal("request::unmanage", add_bar)
end

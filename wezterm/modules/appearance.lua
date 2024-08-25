local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)
  config.color_scheme = "Everforest Dark (Gogh)"

  config.window_background_opacity = 0.7

  config.window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0.3cell",
    bottom = 0,
  }

  config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  }

  config.window_decorations = "RESIZE"

  config.colors = {
    split = wezterm.color.get_builtin_schemes()["Everforest Dark (Gogh)"].ansi[2],
  }

  -- config.use_fancy_tab_bar = false
  -- config.tab_bar_at_bottom = true

  -- local scheme = wezterm.color.get_builtin_schemes()["Everforest Dark (Gogh)"]
  --
  -- local background = wezterm.color.parse(scheme.background)
  --
  -- local h, s, l, _ = background:hsla()
  --
  -- config.colors = {
  --   tab_bar = {
  --     background = string.format("hsla(%s,%s,%s,%s)", h, s, l, config.window_background_opacity),
  --   },
  -- }
end

return M

--- 修改不同应用的配色

local awful = require("awful")
local gfs = require("gears.filesystem")
local config = require("config")
local theme_name = config.theme_name
local theme_style = config.theme_style
local theme = require("theme.colorschemes." .. theme_name .. "." .. theme_style)
theme = theme.switcher

-- █▄▀ █ ▀█▀ ▀█▀ █▄█
-- █░█ █ ░█░ ░█░ ░█░
local function kitty()
  local kitty_theme = theme.kitty
  local cmd = "kitty +kitten themes --reload-in=all " .. kitty_theme
  awful.spawn(cmd)
end

-- █▀▀ ▀█▀ █▄▀
-- █▄█ ░█░ █░█
-- Not really working, idk why -- TODO change to kde
local function gtk()
  local gtk_theme = theme.gtk
  local cmd = "gsettings set org.gnome.desktop.interface gtk-theme '" .. gtk_theme .. "'"
  awful.spawn.with_shell(cmd)
end

-- -- ▀█ ▄▀█ ▀█▀ █░█ █░█ █▀█ ▄▀█
-- -- █▄ █▀█ ░█░ █▀█ █▄█ █▀▄ █▀█
-- -- Change theme by symlinking zathurarc.
-- local function zathura()
--   -- Create backup of user theme.
--   local backup = "~/.config/zathura/zathurarc.user.bak"
--   if not gfs.file_readable(backup) then
--     awful.spawn.with_shell("cp ~/.config/zathura/zathurarc " .. backup)
--   end

--   -- Different zathura themes should all be in ~/.config/zathura
--   local zathura_theme = theme.zathura
--   local cmd = "ln -sf ~/.config/zathura/" .. zathura_theme .. " ~/.config/zathura/zathurarc"
--   awful.spawn.with_shell(cmd)

--   -- To do: auto reload zathura theme
-- end

-- █▀█ █▀█ █▀▀ █
-- █▀▄ █▄█ █▀░ █
local function rofi()
  -- Different rofi themes should all be in ~/.config/rofi/cozy
  local rofi_theme = theme.rofi
  -- Todo: check for different image types
  local img_path = "~/.config/rofi/cozy/" .. rofi_theme .. ".jpg"
  local rasi_path = "~/.config/rofi/cozy/" .. rofi_theme .. ".rasi"

  local symlink_rasi = "ln -sf " .. rasi_path .. "~/.config/rofi/colors.rasi"
  local symlink_img = "ln -sf " .. img_path .. " ~/.config/rofi/image"
end

return function()
  if theme.kitty then kitty() end
  if theme.gtk then gtk() end
  -- if theme.zathura then zathura() end
  -- if theme.rofi    then rofi()    end
end

-- ▄▀█ █░█░█ █▀▀ █▀ █▀█ █▀▄▀█ █▀▀
-- █▀█ ▀▄▀▄▀ ██▄ ▄█ █▄█ █░▀░█ ██▄
-- package manager for luarocks
pcall(require, "luarocks.loader")

-- standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")


-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄
local theme_dir = gears.filesystem.get_configuration_dir() .. "theme/"
beautiful.init(theme_dir .. "theme.lua")

require("configs")

require("ui")

require("helpers")

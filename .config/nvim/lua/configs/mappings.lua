--- Global Keymappings
--- ~~~~~~~~~~~~~~~~~~

local key_map = require("nvim-mapper")

key_map.map("n", "<left>", "<C-w>h", {}, "Window", "window_move_left", "Move Window to [Left]")
key_map.map("n", "<down>", "<C-w>j", {}, "Window", "window_move_down", "Move Window [Down]")
key_map.map("n", "<up>", "<C-w>k", {}, "Window", "window_move_up", "Move Window [Up]")
key_map.map("n", "<right>", "<C-w>l", {}, "Window", "window_move_right", "Move Window to [Right]")

local wezterm = require("wezterm")

-- local function scheme_for_appearance(appearance)
--     if appearance:find("Dark") then
--         return "Catppuccin Mocha"
--     else
--         return "TokyoNightLight (Gogh)"
--     end
-- end

return {
    color_scheme = "Catppuccin Mocha",
    -- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    font = wezterm.font_with_fallback({
        "JetBrainsMono Nerd Font",
        "LXGW WenKai Mono",
        "azuki",
        "Noto Color Emoji",
    }),
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    -- window_decorations = "RESIZE",
    enable_kitty_keyboard = true,
    window_close_confirmation = "NeverPrompt",
    colors = {
        -- TODO stretch tabs https://github.com/wez/wezterm/issues/1914
        tab_bar = {
            background = "rgba(0,0,0,0.2)",
            active_tab = {
                bg_color = "#3399ff",
                fg_color = "#ffffff",

            },
        },
    },
}

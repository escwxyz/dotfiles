--- CMD Autocomplete
--- ~~~~~~~~~~~~~~~~
--- See https://github.com/gelguy/wilder.nvim

--- TODO Icons

local M = {
    "gelguy/wilder.nvim",
    dependencies = {
        "romgrk/fzy-lua-native"
    },
    init = function()
        local wilder = require("wilder")

        wilder.setup({ modes = { ":", "/" } })

        wilder.set_option("pipeline", {
            wilder.branch(
                wilder.cmdline_pipeline({ use_python = 0, fuzzy = 1, fuzzy_filter = wilder.lua_fzy_filter() }),
                wilder.vim_search_pipeline(),
                {
                    wilder.check(function(_, x)
                        return x == ""
                    end),
                    wilder.history(),
                    wilder.result({
                        draw = {
                            function(_, x)
                                return "📆" .. " " .. x
                            end,
                        },
                    }),
                }
            ),
        })

        local gradient = {
            '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
            '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
            '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
            '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
        }

        for i, fg in ipairs(gradient) do
            gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = fg } })
        end

        wilder.set_option(
            "renderer",
            wilder.renderer_mux({
                [":"] = wilder.popupmenu_renderer(
                    wilder.popupmenu_palette_theme({
                        border = "rounded",
                        pumblend = 20,
                        empty_message = wilder.popupmenu_empty_message_with_spinner(),
                        highlights = {
                            gradient = gradient,
                        },
                        highlighter = wilder.highlighter_with_gradient({
                            wilder.lua_fzy_highlighter(),
                        }),
                        max_height = "75%",
                        min_height = 0,
                        prompt_position = "bottom",
                        left = {
                            " ",
                            wilder.popupmenu_devicons(),
                            wilder.popupmenu_buffer_flags({
                                flags = " a + ",
                                -- icons = { ["+"] = icons.ui.Pencil, a = icons.ui.Indicator, h = icons.ui.File },
                            }),
                        },
                        right = {
                            " ",
                            wilder.popupmenu_scrollbar(),
                        },
                    })),
                ["/"] = wilder.wildmenu_renderer({
                    highlighter = wilder.lua_fzy_highlighter(),
                    apply_incsearch_fix = true,
                }),
            })
        )
    end
}


return M

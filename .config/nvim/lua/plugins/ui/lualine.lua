--- Status Line
--- ~~~~~~~~~~~
--- https://github.com/nvim-lualine/lualine.nvim

local M = {}

M.setup = function()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "catppuccin",
            component_separators = {},
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            -- left side
            lualine_a = { "mode" }, -- neovim mode
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    require("nvim-navic").get_location,
                    cond = require("nvim-navic").is_available,
                },
                {
                    function()
                        return "%="
                    end,
                },
                -- TODO overseer integration
                -- TODO hydra integration
            },
            -- right side
            lualine_x = {
                "filename",
                "fileformat",
            },
            lualine_y = { "progress", "location" },
            lualine_z = {
                {
                    function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return " " .. ms .. " ms"
                    end,
                    color = { fg = "#000000" },
                    cond = function()
                        local up_time = os.difftime(os.time(), _G.init_time)
                        return up_time <= 10 -- only last for 10s
                    end
                },
                {
                    function()
                        local up_time = os.difftime(os.time(), _G.init_time)
                        return string.format(
                            "%.2d:%.2d:%.2d",
                            up_time / (60 * 60),
                            up_time / 60 % 60,
                            up_time % 60
                        )
                    end,
                },
                {
                    function()
                        return os.date("%H:%M")
                    end,
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },

            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        -- top bar below bufferline
        winbar = {
            -- lualine_b = {},
            -- lualine_x = {},
            -- lualine_y = {},
            -- lualine_z = {}
        },
        inactive_winbar = {},
        extensions = {
            "toggleterm",
        },
    })
end

return M

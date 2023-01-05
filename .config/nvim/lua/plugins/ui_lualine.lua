--- Status Line
--- ~~~~~~~~~~~
--- https://github.com/nvim-lualine/lualine.nvim

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
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
                ignore_focus = {},
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
                    -- TODO see https://github.com/anuvyklack/hydra.nvim/issues/48
                    --     {
                    --         function()
                    --             local hydra = require("hydra.statusline")
                    --             return hydra.get_name() ~= nil and hydra.get_name() .. ": " .. hydra.get_hint() or
                    --                 hydra.get_hint()
                    --         end,
                    --         cond = require("hydra.statusline").is_active,
                    --         color = { fg = "#ffffff", gui = "bold" }
                    --     },
                },
                -- right side
                lualine_x = {
                    "filename",
                    "fileformat",
                    "filesize",
                },
                lualine_y = { "progress", "location" },
                lualine_z = {
                    -- {
                    --     require("lazy.status").updates,
                    --     cond = require("lazy.status").has_updates,
                    --     color = { fg = "#ff9e64" },
                    -- },
                    {
                        function()
                            ---@diagnostic disable-next-line: different-requires
                            local stats = require("lazy").stats()
                            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                            return " " .. ms .. " ms"
                        end,
                        color = { fg = "#000000" },
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
                -- lualine_c = { 'filename' },
                -- lualine_x = {},
                -- lualine_y = {},
                -- lualine_z = {}
            },
            inactive_winbar = {},
            extensions = {
                "toggleterm",
            },
        })
    end,
}

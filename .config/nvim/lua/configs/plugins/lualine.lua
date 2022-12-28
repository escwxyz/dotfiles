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
                theme = 'auto',
                component_separators = {},
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                -- left side
                lualine_a = { 'mode' }, -- neovim mode
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    'filename',
                    {
                        function()
                            return '%='
                        end,
                    },
                    {
                        -- TODO
                        function()
                            local hydra = require('hydra.statusline')
                            local is_active = hydra.is_active()
                            local hint = hydra.get_hint()

                            -- print(is_active)

                            if is_active and hint ~= nil then
                                return hydra.get_name() .. ": " .. hint
                            else return ""
                            end
                        end,
                        color = { fg = '#ffffff', gui = 'bold' },
                    }
                },
                -- right side
                lualine_x = {
                    'fileformat',
                    -- TODO only show filetype names
                    {
                        "filetype",
                        icon_only = true,

                    },
                    {
                        "aerial",
                        colored = true,
                    },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = { 'progress' }, -- TODO replace with other functions, timer for example
                lualine_z = {
                    'location',
                    {
                        function()
                            local stats = require("lazy").stats()
                            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                            return " " .. ms .. "ms"
                        end,
                        color = { fg = "#000000" },
                    },
                    {
                        function()
                            return " " .. os.date("%H:%M")
                        end,
                    }
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },

                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {
                -- lualine_a = {},
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
    end
}

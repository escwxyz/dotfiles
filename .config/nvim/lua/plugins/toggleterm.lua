--- Terminal
--- ~~~~~~~~
--- https://github.com/akinsho/toggleterm.nvim

return {
    "akinsho/toggleterm.nvim",
    keys = { [[<c-\]] },
    config = function()
        require("toggleterm").setup({
            -- open_mapping = [[<c-\>]],
            autochdir = true,
            direction = "float",
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            }
        })

        local Terminal = require("toggleterm.terminal").Terminal
        --- only useful when use vertical/horizontal direction
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Hydra = require("hydra")
        local cmd = require("hydra.keymap-util").cmd

        local hint = [[
_f_: float _h_: horizontal _v_: vertical
_<C-c>_: exit
        ]]


        local float_terminal = Terminal:new({
            direction = "float"
        })

        local horizontal_terminal = Terminal:new({
            direction = "horizontal"
        })

        local vertical_terminal = Terminal:new({
            direction = "vertical"
        })

        Hydra({
            name = "Terminal",
            hint = hint,
            config = {
                color = "teal",
                invoke_on_body = true,
                hint = {
                    border = "rounded",
                    position = "bottom"
                },

            },
            mode = { "i", "n", "t" },
            body = [[<C-\>]],
            heads = {
                { "f", function() float_terminal:toggle() end },
                { "h", function() horizontal_terminal:toggle() end },
                { "v", function() vertical_terminal:toggle() end },
                { "<C-c>", cmd "ToggleTermToggleAll", }
                -- { "<Esc>", nil }
            }
        })


        -- btop
        -- local btop = Terminal:new({
        --     cmd = "btop",
        --     hidden = true,
        --     direction = "float",
        --     float_opts = {
        --         border = "curved"
        --     }
        -- })

        -- key_map.map("n", "<leader>bb", function()
        --     btop:toggle()
        -- end, { silent = true, }, "Utils", "btop", "Open btop")

    end
}

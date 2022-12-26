--- Terminal
--- ~~~~~~~~
--- https://github.com/akinsho/toggleterm.nvim

return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
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

        local key_map = require("nvim-mapper")
        --- only useful when use vertical/horizontal direction
        -- function _G.set_terminal_keymaps()
        --     local opts = { buffer = 0 }
        --     vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        --     vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        --     vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        --     vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        --     vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        --     vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        -- end

        -- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        key_map.map_virtual({ "n", "i" }, [[<c-\>]], "", {}, "Terminal", "toggle_terminal", "Toggle Terminal")
        -- key_map.map_virtual({ "t" }, "<c-k>", "", {}, "Terminal", "jump_out_from_terminal", "Jump Out From Terminal")

        local Terminal = require("toggleterm.terminal").Terminal

        -- Lazygit

        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            float_opts = {
                border = "curved"
            }
        })

        key_map.map("n", "<leader>gg", function()
            lazygit:toggle()
        end, { silent = true }, "Git", "lazygit",
            "Open Lazygit")

        -- btop
        local btop = Terminal:new({
            cmd = "btop",
            hidden = true,
            direction = "float",
            float_opts = {
                border = "curved"
            }
        })

        key_map.map("n", "<leader>bb", function()
            btop:toggle()
        end, { silent = true, }, "Utils", "btop", "Open btop")

    end
}

--- Navigation between files / terminals
--- ~~~~~~~~~~
--- See https://github.com/ThePrimeagen/harpoon

--- ?? how to use?

local M = {
    "ThePrimeagen/harpoon",
    event = "BufReadPre",
    config = function()
        require("harpoon").setup({
            global_settings = {
                -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
                save_on_toggle = false,
                save_on_change = true,
                -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
                enter_on_sendcmd = false,
                -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
                tmux_autoclose_windows = false,
                -- filetypes that you want to prevent from adding to the harpoon list menu.
                excluded_filetypes = { "harpoon" },
                -- set marks specific to each git branch inside git repository
                mark_branch = false,
            },
            -- projects = {
            --     -- Yes $HOME works
            --     ["$HOME/personal/vim-with-me/server"] = {
            --         term = {
            --             cmds = {
            --                 "./env && npx ts-node src/index.ts"
            --             }
            --         }
            --     }
            -- }
        })

        -- Keymapping

        vim.keymap.set("n", "<leader>m", function()
            require("harpoon.mark").add_file()
        end, { desc = "[M]ark Files to Harpoon" })
        vim.key.set("n", "<leader>fm", "<cmd>:Telescope harpoon marks<cr>", {
            desc = "[F]ind Harpoom [M]arks"
        })

        vim.keymap.set("n", "<leader>h", function()
            require("harpoon.ui").toggle_quick_menu()
        end, { desc = "Toggle [H]arpoon Menu" })
        vim.keymap.set("n", "h[", function()
            require("harpoon.ui").nav_prev()
        end, { desc = "To [P]revious Harpoon Mark" })
        vim.keymap.set("n", "h]", function()
            require("harpoon.ui").nav_next()
        end, { desc = "To [N]ext Harpoon Mark" })

        -- TODO terminal related


    end
}


return M

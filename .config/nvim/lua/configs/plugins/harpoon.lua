--- Navigation between files / terminals
--- ~~~~~~~~~~
--- See https://github.com/ThePrimeagen/harpoon

return {
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
                -- filetypes that you want to prevent from adding to the harpoon list menu.
                excluded_filetypes = { "harpoon" },
                -- set marks specific to each git branch inside git repository
                mark_branch = false,
            },
            -- projects = {
            --     -- Yes $HOME whorks
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

        local Hydra = require("hydra")

        local hint = [[
^_m_: mark buffer _p_: prev mark _n_: next mark
^
^^_<Enter>_: menu^^ _<Esc>_: exit     
        ]]

        Hydra({
            name = "Harpoon",
            config = {
                color = 'teal',
                invoke_on_body = true,
                hint = {
                    position = 'bottom',
                    border = 'rounded',
                },
            },
            hint = hint,
            mode = "n",
            body = "<leader>h",
            heads = {
                { "m", require("harpoon.mark").add_file, { desc = "Mark Current Buffer", exit = true } }, -- TODO with notification feedback
                { "p", require("harpoon.ui").nav_prev, { exit = false } },
                { "n", require("harpoon.ui").nav_next, { exit = false } },
                { "<Enter>", require("harpoon.ui").toggle_quick_menu, { desc = "Menu", exit = true } },
                { "<Esc>", nil, { exit = true } }

            }
        })

        -- TODO terminal related
    end
}

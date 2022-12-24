--- Navigation between files / terminals
--- ~~~~~~~~~~
--- See https://github.com/ThePrimeagen/harpoon

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

        local key_map = require("nvim-mapper")

        key_map.map("n", "<leader>m", function()
            require("harpoon.mark").add_file()
        end, { buffer = 0 }, "Harpoon", "mark_current_buffer", "[M]ark Current Buffer")

        key_map.map("n", "<leader>fm", "<cmd>:Telescope harpoon marks<cr>", {}, "Telescope", "find_harpoon_marks",
            "[F]ind Harpoon [M]arks")

        key_map.map("n", "<leader>h", function()
            require("harpoon.ui").toggle_quick_menu()
        end, {}, "Harpoon", "toggle_harpoon_menu", "Toggle [H]arpoon Menu")

        key_map.map("n", "h[", function()
            require("harpoon.ui").nav_prev()
        end, {}, "Harpoon", "go_to_prev_mark", "Previous Harpoon Mark")

        key_map.map("n", "h]", function()
            require("harpoon.ui").nav_next()
        end, {}, "Harpoon", "go_to_next_mark", "Next Harpoon Mark")

        -- TODO terminal related
    end
}


return M

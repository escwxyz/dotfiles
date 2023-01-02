--- Navigation between files / terminals
--- ~~~~~~~~~~
--- See https://github.com/ThePrimeagen/harpoon

return {
    "ThePrimeagen/harpoon",
    keys = {
        "<leader>h"
    },
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

        require("hydras.harpoon-hydra").init_hydra()
    end
}

return {
    "sindrets/winshift.nvim",
    config = function()
        require("winshift").setup({
            keymaps = {
                disable_defaults = true,
                win_move_mode = {
                    ["h"] = "left",
                    ["j"] = "down",
                    ["k"] = "up",
                    ["l"] = "right",
                    ["H"] = "far_left",
                    ["J"] = "far_down",
                    ["K"] = "far_up",
                    ["L"] = "far_right",
                }
            },
        })

        local mapper = require("nvim-mapper")

        local key_map = function(key, cmd, id, desc)
            mapper.map("n", key, cmd, { silent = true }, "Window", id, desc)
        end

        key_map("<c-w>", "<cmd>:WinShift<cr>", "start_winshift", "Start [W]inShift")
        key_map("<c-w>w", "<cmd>:WinShift swap", "swap_windows", "Swap Windows")
        -- TODO map virtual
    end
}

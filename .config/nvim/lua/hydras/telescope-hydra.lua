local M = {}

local Hydra = require("hydra")

local hint = [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀_f_: Find Files
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⠿⣿⣦⠀⠀⠀⠀⠀⠀⠀_r_: Find Repos
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣭⡣⣽⣶⣿⠟⠁⠀⠀⠀⠀⠀⠀_h_: Help Tags
    ⠀⠀⠀⠀⠀⡀⠀⠀⢀⡤⢿⡉⠹⣷⡿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀_t_: Find Todos
    ⠀⠀⠀⣠⡾⠃⢠⢴⡅⠀⣈⣿⡺⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_m_: Harpoon Marks
    ⠀⠀⠘⠋⠈⠽⣇⠀⡽⠿⠟⣻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_a_: Aerial Outline
    ⠀⠀⠐⢶⣿⠗⠚⠉⠀⢰⣿⢻⣿⣿⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_k_: Keymaps
    ⠀⠀⠀⠀⠀⠀⠀⠀⡰⡫⠃⢸⢸⠈⣯⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_o_: Vim Options
    ⠀⠀⠀⠀⠀⠀⠀⡰⡳⠁⠀⢸⢸⠀⠘⡲⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀_b_: Search in buffer 
    ⠀⠀⠀⠀⠀⠀⣰⡥⠁⠀⢀⣼⣼⠀⠀⢳⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀_u_: Undo Tree
    ⠀⠀⠀⠀⢀⡾⣵⠥⠔⠚⠛⢻⠟⠛⠒⠤⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀_g_: Live Grep
    ⠀⠀⠀⠀⣼⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⡞⡀⠀⠀⠀⠀⠀⠀⠀_n_: Notify
    ⠀⠀⠀⠼⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_<Esc>_: Exit
        ]]

M.init_hydra = function()
    return Hydra({
        name = "Telescope",
        hint = hint,
        config = {
            color = "teal",
            invoke_on_body = true,
            hint = {
                position = "middle",
                border = "rounded",
            },
        },
        mode = "n",
        body = "<leader>f",
        heads = {
            { "f", "<leader>ff", { remap = true } },
            { "r", "<leader>fr", { remap = true } },
            { "t", "<leader>ft", { remap = true } },
            { "a", "<leader>fa", { remap = true } },
            { "g", "<leader>fg", { remap = true } },
            { "h", "<leader>fh", { remap = true } },
            { "m", "<leader>fm", { remap = true } },
            { "k", "<leader>fk", { remap = true } },
            { "o", "<leader>fo", { remap = true } },
            { "b", "<leader>fb", { remap = true } },
            { "u", "<leader>fu", { remap = true } },
            { "n", "<leader>fn", { remap = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
        },
    })
end

return M

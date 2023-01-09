-- Node action based on Treesitter
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--https://github.com/CKolkey/ts-node-action

local M = {}

M.setup = function()
    require("ts-node-action").setup() --TODO to add more actions based on filetypes see https://github.com/CKolkey/ts-node-action/tree/master/lua/ts-node-action/filetypes
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("NodeAction", require("ts-node-action").node_action, {})
end

return M

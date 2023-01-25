return {
    "ckolkey/ts-node-action",
    enabled = true,
    cmd = { "NodeAction" },
    config = function()
        vim.api.nvim_create_user_command("NodeAction", require("ts-node-action").node_action, {})
    end
}

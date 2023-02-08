local M = {}

-- TODO icons

M.setup = function()
    require("crates").setup()
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("CratesUpgrade", function()
        require("crates").upgrade_crate()
    end, {})
    vim.api.nvim_create_user_command("CratesUpgradeSelected", function()
        require("crates").upgrade_crates()
    end, {})
    vim.api.nvim_create_user_command("CratesUpgradeAll", function()
        require("crates").upgrade_all_crates()
    end, {})

    vim.api.nvim_create_user_command("CratesDocumentation", function()
        require("crates").open_documentation()
    end, {})
end

return M

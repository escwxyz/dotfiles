local command = vim.api.nvim_create_user_command

return {
    "anuvyklack/hydra.nvim",
    enabled = true,
    lazy = false,
    config = function()
        command("HydraEditorOptions", function()
            require("hydras.options-hydra").activate()
        end, {})
        command("HydraHarpoon", function()
            require("hydras.harpoon-hydra").activate()
        end, {})
        command("HydraUrlView", function()
            require("hydras.urlview-hydra").activate()
        end, {})
    end,
}

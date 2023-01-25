local opts = {
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
        width = 0.8,
        height = 0.8,
        icons = {
            package_installed = "Y",
            package_pending = "P",
            package_uninstalled = "N",
        },
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    },
}

return {
    "williamboman/mason.nvim",
    enabled = true,
    lazy = false,
    config = function()
        require("mason").setup(opts)
    end
}

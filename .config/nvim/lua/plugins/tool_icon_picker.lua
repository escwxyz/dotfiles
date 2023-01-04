-- TODO triggers telescope??
return {
    "ziontee113/icon-picker.nvim",
    cmd = { "IconPickerNormal", "IconPickerYank", "IconPickerInsert" },
    config = function()
        require("icon-picker").setup({
            disable_legacy_commands = true,
        })
    end,
}

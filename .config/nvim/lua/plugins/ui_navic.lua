return {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    config = {
        icons = require("configs.icons").navic_icons,
        highlight = false,
        separator = " > ",
        depth_limit = 5,
        depth_limit_indicator = "..",
        safe_output = true,
    },
}

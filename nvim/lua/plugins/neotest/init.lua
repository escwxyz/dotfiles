return {
    "nvim-neotest/neotest",
    enabled = true,
    dependencies = {
        { "marilari88/neotest-vitest", },
        { "sidlatau/neotest-dart" },
        { "rouge8/neotest-rust" },
    },
    config = function()
        require("plugins.neotest.config").setup()
    end
}

--- Intergrate nnn as file explorer in neovim
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/luukvbaal/nnn.nvim
return {
	"luukvbaal/nnn.nvim",
	event = "VeryLazy",
	config = function()
		require("nnn").setup({
			explorer = {
				cmd = "nnn",
				width = 36,
				side = "topleft",
				session = "", -- TODO or "global" / "local" / "shared"
				tabs = true,
				fullscreen = true,
			},
			picker = {
				cmd = "nnn",
				style = {
					width = 0.9,
					height = 0.8,
					xoffset = 0.5,
					yoffset = 0.5,
					border = "rounded"
				},
				session = "", -- TODO
				fullscreen = true,
			},
		})

		local mapper = require("nvim-mapper")

		mapper.map({ "n", "i" }, "<leader>n", "<cmd>:NnnExplorer<cr>", { silent = true }, "NNN", "nnn_explorer",
			"Open [N^3] Explorer")

		mapper.map("n", "<leader>nn", "<cmd>:NnnPicker<cr>", { silent = true }, "NNN", "nnn_picker", "Open [N^3] Picker")
	end
}

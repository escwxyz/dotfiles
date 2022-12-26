--- Intergrate nnn as file explorer in neovim
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- https://github.com/luukvbaal/nnn.nvim
return {
	"luukvbaal/nnn.nvim",
	keys = { "<leader>n", "<cmd>:NnnExplorer<cr>", desc = "nnn Explorer" },
	config = function()

		local nnn = require("nnn")

		local builtin = nnn.builtin

		nnn.setup({
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
			auto_close = true,
			mappings = {
				{ "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
				{ "<C-s>", builtin.open_in_split }, -- open file(s) in split
				{ "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
				{ "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
				{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
				{ "<C-w>", builtin.cd_to_path }, -- cd to file directory
				{ "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
			}
		})

		local mapper = require("nvim-mapper")

		mapper.map({ "n", "i", "t" }, "<leader>n", "<cmd>:NnnExplorer<cr>", { silent = true }, "NNN", "nnn_explorer",
			"Open [N^3] Explorer")

		mapper.map({ "n", "t" }, "<leader>nn", "<cmd>:NnnPicker<cr>", { silent = true }, "NNN", "nnn_picker",
			"Open [N^3] Picker")
	end
}

-- neo-tree.nvim
-- Neo-Tree file explorer
local utils = require("core.utils")

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
	},
	config = function()
		local neoCacheDir = utils.expand_path("~/.cache/mc-nvim/neo/")

		-- make cache dir if it doesn't exist
		if vim.fn.isdirectory(neoCacheDir) ~= 1 then
			vim.fn.mkdir(neoCacheDir, "p") -- "p" makes parent dirs too
		end

		-- Toggle using <leader>ne
		vim.keymap.set(
			"n",
			"<leader>ne",
			"<cmd>Neotree toggle<cr>",
			{ noremap = true, silent = true, desc = "Toggle file tree/explorer (Neotree)" }
		)
	end,
	lazy = false,
}

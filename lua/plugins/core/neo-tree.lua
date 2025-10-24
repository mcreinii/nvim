-- neo-tree.nvim
-- Neo-Tree file explorer
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

-- neo-tree.nvim
-- Neo-Tree file explorer
local utils = require("core.utils")

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	opts = {
		source_selector = {
			winbar = true,
		},
		window = {
			width = 30,
			mappings = {
				["<tab>"] = "next_source",
				["<s-tab>"] = "prev_source",
			},
		},
	},
	config = function(_, opts)
		local neoCacheDir = utils.expand_path("~/.cache/mc-nvim/neo/")

		-- Make cache directory if it doesn't exist
		if vim.fn.isdirectory(neoCacheDir) ~= 1 then
			vim.fn.mkdir(neoCacheDir, "p") -- "p" makes parent directories too
		end

		-- Toggle using <leader>ne
		vim.keymap.set(
			"n",
			"<leader>ne",
			"<cmd>Neotree toggle<cr>",
			{ noremap = true, silent = true, desc = "Toggle filesystem (Neotree)" }
		)
		-- Switch to buffers
		vim.keymap.set("n", "<leader>nb", "<cmd>Neotree source=buffers<cr>", { desc = "Toggle buffers (Neotree)" })
		-- Switch to git_status
		vim.keymap.set("n", "<leader>ng", "<cmd>Neotree source=git_status<cr>", { desc = "Toggle git status (Neotree)" })
		-- Switch to document_symbols
		vim.keymap.set("n", "<leader>ns", "<cmd>Neotree source=document_symbols<cr>", { desc = "Toggle symbols (Neotree)" })

		require("neo-tree").setup(opts)
	end,
	lazy = false,
}

--- Telescope fuzzy finder configuration
--- Provides fuzzy finding for files, buffers, grep, and more
--- Includes file browser extension that replaces netrw

return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		extensions = {
			file_browser = {
				-- Replace netrw with telescope file browser
				hijack_netrw = true,
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("file_browser")

		local map = require("helpers.keymap").set
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions

		-- File finding
		map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recent files" })
		map("n", "<leader>fG", builtin.git_files, { desc = "Telescope git files" })

		-- Content search
		map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

		-- Buffer and diagnostics
		map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })

		-- File browser
		map("n", "<leader>fe", extensions.file_browser.file_browser, { desc = "Telescope file browser" })

		-- Help
		map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
